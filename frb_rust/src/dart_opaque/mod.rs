use crate::generalized_isolate::{Channel, IntoDart};
use crate::platform_types::{handle_to_message_port, DartAbi, SendableMessagePortHandle};
use dart_sys::Dart_Handle;
use dart_sys::Dart_NewPersistentHandle_DL;
use log::warn;
use std::thread::ThreadId;

#[cfg(wasm)]
mod web;
#[cfg(wasm)]
pub use web::*;

#[cfg(not(wasm))]
mod io;
use crate::dart_opaque::thread_box::ThreadBox;
use crate::for_generated::{box_from_leak_ptr, new_leak_box_ptr};
#[cfg(not(wasm))]
pub use io::*;

#[cfg(not(wasm))]
mod auto_drop_dart_persistent_handle;

mod dart2rust;
mod rust2dart;
mod thread_box;

/// Arbitrary Dart object, whose type can be even non-encodable and non-transferable.
#[derive(Debug)]
pub struct DartOpaque {
    /// The internal persistent handle
    // `Option` is used for correct drop.
    persistent_handle: Option<ThreadBox<GeneralizedAutoDropDartPersistentHandle>>,

    /// The port to drop object (when we cannot drop in current thread)
    drop_port: SendableMessagePortHandle,
}

impl DartOpaque {
    pub fn new(handle: Dart_Handle, drop_port: SendableMessagePortHandle) -> Self {
        let auto_drop_persistent_handle =
            GeneralizedAutoDropDartPersistentHandle::new_from_non_persistent_handle(handle);
        Self {
            persistent_handle: Some(ThreadBox::new(auto_drop_persistent_handle)),
            drop_port,
        }
    }
}

impl Drop for DartOpaque {
    fn drop(&mut self) {
        if let Some(persistent_handle) = self.persistent_handle.take() {
            // If we forget to do so, ThreadBox will panic because it requires things to be dropped on creation thread
            if !persistent_handle.is_on_creation_thread() {
                let channel = Channel::new(handle_to_message_port(&self.drop_port));
                let ptr = new_leak_box_ptr(persistent_handle) as usize;

                if !channel.post(ptr) {
                    warn!("Drop DartOpaque after closing the port, thus the object will be leaked forever.");
                    // In case logs are disabled
                    println!("Drop DartOpaque after closing the port, thus the object will be leaked forever.");
                };
            }
        }
    }
}

// TODO old name: `drop_dart_object`, rename all users
#[no_mangle]
pub unsafe extern "C" fn dart_opaque_drop_thread_box_persistent_handle(ptr: usize) {
    let value: ThreadBox<GeneralizedAutoDropDartPersistentHandle> = box_from_leak_ptr(ptr as _);
    drop(value);
}
