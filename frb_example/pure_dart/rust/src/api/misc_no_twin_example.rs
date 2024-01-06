// FRB_INTERNAL_GENERATOR: {"forbiddenDuplicatorModes": ["sync", "rustAsync", "sse", "syncSse", "rustAsyncSse"]}

use flutter_rust_bridge::frb;
use std::sync::Arc;

// Reproduce https://github.com/fzyzcjy/flutter_rust_bridge/issues/1613
#[frb(opaque)]
pub struct StructWithArcField {
    inner: Arc<String>,
}

impl StructWithArcField {
    pub fn new(s: String) -> StructWithArcField {
        Self { inner: Arc::new(s) }
    }

    pub async fn func_async(&self) -> usize {
        self.inner.len()
    }
}
