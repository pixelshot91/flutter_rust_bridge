// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `attribute.rs` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

use flutter_rust_bridge::frb;
use log::info;

#[frb]
#[derive(Debug, Clone)]
pub struct CustomizedTwinSync {
    pub final_field: String,
    #[frb(non_final)]
    pub non_final_field: Option<String>,
}

#[frb(ignore)]
#[flutter_rust_bridge::frb(sync)]
pub fn func_should_not_exist_in_dart_twin_sync() {}

pub struct EmptyTwinSync;

impl EmptyTwinSync {
    #[frb(ignore)]
    #[flutter_rust_bridge::frb(sync)]
    pub fn method_should_not_exist_in_dart_twin_sync() {}
}

#[flutter_rust_bridge::frb(sync)]
pub fn handle_customized_struct_twin_sync(val: CustomizedTwinSync) {
    info!("{:#?}", val);
}

/// Example for @freezed and @meta.immutable
#[frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct UserIdTwinSync {
    #[frb(default = 0)]
    pub value: u32,
}

#[flutter_rust_bridge::frb(sync)]
pub fn next_user_id_twin_sync(user_id: UserIdTwinSync) -> UserIdTwinSync {
    UserIdTwinSync {
        value: user_id.value + 1,
    }
}

// Note: Some attributes are put on `KitchenSinkTwinSync` currently
// (but we can add more tests in this file later)
