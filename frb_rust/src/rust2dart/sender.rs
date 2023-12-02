use crate::generalized_isolate::Channel;
use crate::platform_types::MessagePort;
use allo_isolate::IntoDart;

#[derive(Clone)]
pub struct Rust2DartSender {
    pub(crate) channel: Channel,
}

impl Rust2DartSender {
    pub fn new(channel: Channel) -> Self {
        Rust2DartSender { channel }
    }

    pub fn send(&self, msg: impl IntoDart) -> bool {
        self.channel.post(msg)
    }
}
