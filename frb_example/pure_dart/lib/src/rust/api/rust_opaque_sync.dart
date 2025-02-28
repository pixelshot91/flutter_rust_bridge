// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'pseudo_manual/rust_opaque_sync_twin_sse.dart';

HideData? syncOptionRustOpaqueTwinNormal({dynamic hint}) =>
    RustLib.instance.api.syncOptionRustOpaqueTwinNormal(hint: hint);

HideData syncCreateOpaqueTwinNormal({dynamic hint}) =>
    RustLib.instance.api.syncCreateOpaqueTwinNormal(hint: hint);

NonSendHideData syncCreateSyncOpaqueTwinNormal({dynamic hint}) =>
    RustLib.instance.api.syncCreateSyncOpaqueTwinNormal(hint: hint);

NonCloneData syncCreateNonCloneTwinNormal({dynamic hint}) =>
    RustLib.instance.api.syncCreateNonCloneTwinNormal(hint: hint);

String syncRunOpaqueTwinNormal(
        {required NonSendHideData opaque, dynamic hint}) =>
    RustLib.instance.api.syncRunOpaqueTwinNormal(opaque: opaque, hint: hint);

/// Structure for testing the sync-mode RustOpaque code generator.
/// FrbOpaqueSyncReturn must be only return type.
/// FrbOpaqueSyncReturn must be without wrapper like Option<> Vec<> etc.
FrbOpaqueSyncReturn frbSyncGeneratorTestTwinNormal({dynamic hint}) =>
    RustLib.instance.api.frbSyncGeneratorTestTwinNormal(hint: hint);
