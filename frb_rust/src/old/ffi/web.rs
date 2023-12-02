use super::DartAbi;
use super::MessagePort;
use crate::support;
pub use crate::wasm_bindgen_src::transfer::*;
pub use crate::wasm_bindgen_src::transfer::*;
use crate::DartSafe;
use crate::RustOpaque;
pub use js_sys;
pub use js_sys::Array as JsArray;
use js_sys::*;
use std::iter::FromIterator;
pub use wasm_bindgen;
pub use wasm_bindgen::closure::Closure;
pub use wasm_bindgen::prelude::*;
pub use wasm_bindgen::JsCast;
use web_sys::BroadcastChannel;

#[wasm_bindgen]
extern "C" {
    /// Objects implementing the interface of [`web_sys::MessagePort`].
    ///
    /// Attempts to coerce [`JsValue`]s into this interface using [`dyn_into`][JsCast::dyn_into]
    /// or [`dyn_ref`][JsCast::dyn_ref] will fail at runtime.
    #[derive(Clone)]
    pub type PortLike;
    #[wasm_bindgen(method, catch, js_name = "postMessage")]
    pub fn post_message(this: &PortLike, value: &JsValue) -> Result<(), JsValue>;
    #[wasm_bindgen(method, catch)]
    pub fn close(this: &PortLike) -> Result<(), JsValue>;
}

impl PortLike {
    /// Create a [`BroadcastChannel`] with the specified name.
    pub fn broadcast(name: &str) -> Self {
        BroadcastChannel::new(name)
            .expect("Failed to create broadcast channel")
            .unchecked_into()
    }
}

