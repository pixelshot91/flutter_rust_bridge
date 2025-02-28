use crate::codec::BaseCodec;
use crate::codec::Rust2DartMessageTrait;
use crate::generalized_isolate::{channel_to_handle, Channel};
use crate::handler::error::Error;
use crate::handler::error_listener::ErrorListener;
use crate::handler::executor::Executor;
use crate::handler::handler::{FfiCallMode, TaskContext, TaskInfo, TaskRetFutTrait};
use crate::handler::implementation::error_listener::handle_non_sync_panic_error;
use crate::misc::panic_backtrace::{CatchUnwindWithBacktrace, PanicBacktrace};
use crate::platform_types::MessagePort;
use crate::rust2dart::context::TaskRust2DartContext;
use crate::rust2dart::sender::Rust2DartSender;
use crate::rust2dart::stream_sink::StreamSinkCloser;
use crate::rust_async::BaseAsyncRuntime;
use crate::thread_pool::BaseThreadPool;
use crate::transfer;
use futures::FutureExt;
use std::future::Future;
use std::panic::AssertUnwindSafe;
use std::sync::Arc;

/// The default executor used.
/// It creates an internal thread pool, and each call to a Rust function is
/// handled by a different thread.
pub struct SimpleExecutor<EL: ErrorListener, TP: BaseThreadPool, AR: BaseAsyncRuntime> {
    error_listener: EL,
    thread_pool: TP,
    async_runtime: AR,
}

impl<EL: ErrorListener, TP: BaseThreadPool, AR: BaseAsyncRuntime> SimpleExecutor<EL, TP, AR> {
    /// Create a new executor backed by a thread pool.
    pub fn new(error_listener: EL, thread_pool: TP, async_runtime: AR) -> Self {
        SimpleExecutor {
            error_listener,
            thread_pool,
            async_runtime,
        }
    }

    pub fn thread_pool(&self) -> &TP {
        &self.thread_pool
    }
}

impl<EL: ErrorListener + Sync, TP: BaseThreadPool, AR: BaseAsyncRuntime> Executor
    for SimpleExecutor<EL, TP, AR>
{
    fn execute_normal<Rust2DartCodec, TaskFn>(&self, task_info: TaskInfo, task: TaskFn)
    where
        TaskFn: FnOnce(
                TaskContext<Rust2DartCodec>,
            ) -> Result<Rust2DartCodec::Message, Rust2DartCodec::Message>
            + Send
            + 'static,
        Rust2DartCodec: BaseCodec,
    {
        let el = self.error_listener;
        let el2 = self.error_listener;

        let TaskInfo { port, mode, .. } = task_info;
        let port = port.unwrap();

        self.thread_pool.execute(transfer!(|port: MessagePort| {
            let stream_sink_closer = maybe_create_stream_sink_closer(&port, mode);

            #[allow(clippy::clone_on_copy)]
            let port2 = port.clone();
            let thread_result = PanicBacktrace::catch_unwind(AssertUnwindSafe(|| {
                #[allow(clippy::clone_on_copy)]
                let sender = Rust2DartSender::new(Channel::new(port2.clone()));
                let task_context = TaskContext::new(TaskRust2DartContext::new(
                    sender.clone(),
                    stream_sink_closer.clone(),
                ));

                let ret = task(task_context);

                ExecuteNormalOrAsyncUtils::handle_result::<Rust2DartCodec, _>(
                    ret, mode, sender, el2, port2,
                );
            }));

            if let Err(error) = thread_result {
                handle_non_sync_panic_error::<Rust2DartCodec>(el, port, error);
            }
        }));
    }

    fn execute_sync<Rust2DartCodec, SyncTaskFn>(
        &self,
        _task_info: TaskInfo,
        sync_task: SyncTaskFn,
    ) -> Rust2DartCodec::Message
    where
        SyncTaskFn: FnOnce() -> Result<Rust2DartCodec::Message, Rust2DartCodec::Message>,
        Rust2DartCodec: BaseCodec,
    {
        match sync_task() {
            Ok(data) => data,
            Err(err) => {
                self.error_listener.on_error(Error::CustomError);
                err
            }
        }
    }

    #[cfg(feature = "rust-async")]
    fn execute_async<Rust2DartCodec, TaskFn, TaskRetFut>(&self, task_info: TaskInfo, task: TaskFn)
    where
        TaskFn: FnOnce(TaskContext<Rust2DartCodec>) -> TaskRetFut + Send + 'static,
        TaskRetFut: Future<Output = Result<Rust2DartCodec::Message, Rust2DartCodec::Message>>
            + TaskRetFutTrait,
        Rust2DartCodec: BaseCodec,
    {
        let el = self.error_listener;
        let el2 = self.error_listener;

        self.async_runtime.spawn(async move {
            let TaskInfo { port, mode, .. } = task_info;
            let port = port.unwrap();
            #[allow(clippy::clone_on_copy)]
            let port2 = port.clone();

            let stream_sink_closer = maybe_create_stream_sink_closer(&port, mode);

            let async_result = AssertUnwindSafe(async {
                #[allow(clippy::clone_on_copy)]
                let sender = Rust2DartSender::new(Channel::new(port2.clone()));
                let task_context = TaskContext::new(TaskRust2DartContext::new(
                    sender.clone(),
                    stream_sink_closer.clone(),
                ));

                let ret = task(task_context).await;

                ExecuteNormalOrAsyncUtils::handle_result::<Rust2DartCodec, _>(
                    ret, mode, sender, el2, port2,
                );
            })
            .catch_unwind()
            .await;

            if let Err(err) = async_result {
                let err = CatchUnwindWithBacktrace::new(err, PanicBacktrace::take_last());
                handle_non_sync_panic_error::<Rust2DartCodec>(el, port, err);
            }
        });
    }
}

struct ExecuteNormalOrAsyncUtils;

impl ExecuteNormalOrAsyncUtils {
    fn handle_result<Rust2DartCodec, EL>(
        ret: Result<Rust2DartCodec::Message, Rust2DartCodec::Message>,
        mode: FfiCallMode,
        sender: Rust2DartSender,
        el: EL,
        _port: MessagePort,
    ) where
        EL: ErrorListener + Sync,
        Rust2DartCodec: BaseCodec,
    {
        match ret {
            Ok(result) => {
                match mode {
                    FfiCallMode::Normal => {
                        sender.send_or_warn(result.into_dart_abi());
                    }
                    FfiCallMode::Stream => {
                        // nothing - ignore the return value of a Stream-typed function
                    }
                    // frb-coverage:ignore-start
                    _ => unreachable!(),
                    // frb-coverage:ignore-start
                }
            }
            Err(error) => {
                el.on_error(Error::CustomError);
                sender.send_or_warn(error.into_dart_abi());
            }
        };
    }
}

fn maybe_create_stream_sink_closer<Rust2DartCodec: BaseCodec>(
    port: &MessagePort,
    mode: FfiCallMode,
) -> Option<Arc<StreamSinkCloser<Rust2DartCodec>>> {
    (mode == FfiCallMode::Stream).then(|| {
        #[allow(clippy::clone_on_copy)]
        let handle = channel_to_handle(&Channel::new(port.clone()));
        Arc::new(StreamSinkCloser::new(handle))
    })
}
