// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> rustAutoOpaqueArgOwnTwinSse(
        {required NonCloneSimpleTwinSse arg,
        required int expect,
        dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueArgOwnTwinSse(arg: arg, expect: expect, hint: hint);

Future<void> rustAutoOpaqueArgBorrowTwinSse(
        {required NonCloneSimpleTwinSse arg,
        required int expect,
        dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueArgBorrowTwinSse(arg: arg, expect: expect, hint: hint);

Future<void> rustAutoOpaqueArgMutBorrowTwinSse(
        {required NonCloneSimpleTwinSse arg,
        required int expect,
        required int adder,
        dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueArgMutBorrowTwinSse(
        arg: arg, expect: expect, adder: adder, hint: hint);

Future<NonCloneSimpleTwinSse> rustAutoOpaqueReturnOwnTwinSse(
        {required int initial, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueReturnOwnTwinSse(initial: initial, hint: hint);

Future<NonCloneSimpleTwinSse> rustAutoOpaqueArgOwnAndReturnOwnTwinSse(
        {required NonCloneSimpleTwinSse arg, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueArgOwnAndReturnOwnTwinSse(arg: arg, hint: hint);

Future<void> rustAutoOpaqueTwoArgsTwinSse(
        {required NonCloneSimpleTwinSse a,
        required NonCloneSimpleTwinSse b,
        dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueTwoArgsTwinSse(a: a, b: b, hint: hint);

Future<void> rustAutoOpaqueNormalAndOpaqueArgTwinSse(
        {required NonCloneSimpleTwinSse a, required String b, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueNormalAndOpaqueArgTwinSse(a: a, b: b, hint: hint);

/// "+" inside the type signature
Future<void> rustAutoOpaquePlusSignArgTwinSse(
        {required BoxMyTraitTwinSse arg, dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaquePlusSignArgTwinSse(arg: arg, hint: hint);

Future<BoxMyTraitTwinSse> rustAutoOpaquePlusSignReturnTwinSse({dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaquePlusSignReturnTwinSse(hint: hint);

Future<void> rustAutoOpaqueCallableArgTwinSse(
        {required BoxFnStringString arg, dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueCallableArgTwinSse(arg: arg, hint: hint);

Future<BoxFnStringString> rustAutoOpaqueCallableReturnTwinSse({dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueCallableReturnTwinSse(hint: hint);

Future<void> rustAutoOpaqueTraitObjectArgOwnTwinSse(
        {required BoxHelloTraitTwinSse arg,
        required String expect,
        dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueTraitObjectArgOwnTwinSse(
        arg: arg, expect: expect, hint: hint);

Future<void> rustAutoOpaqueTraitObjectArgBorrowTwinSse(
        {required BoxHelloTraitTwinSse arg,
        required String expect,
        dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueTraitObjectArgBorrowTwinSse(
        arg: arg, expect: expect, hint: hint);

Future<void> rustAutoOpaqueTraitObjectArgMutBorrowTwinSse(
        {required BoxHelloTraitTwinSse arg,
        required String expect,
        dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueTraitObjectArgMutBorrowTwinSse(
        arg: arg, expect: expect, hint: hint);

Future<BoxHelloTraitTwinSse> rustAutoOpaqueTraitObjectReturnOwnOneTwinSse(
        {dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueTraitObjectReturnOwnOneTwinSse(hint: hint);

Future<BoxHelloTraitTwinSse> rustAutoOpaqueTraitObjectReturnOwnTwoTwinSse(
        {dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueTraitObjectReturnOwnTwoTwinSse(hint: hint);

Future<void> rustAutoOpaqueStructWithGoodAndOpaqueFieldArgOwnTwinSse(
        {required StructWithGoodAndOpaqueFieldTwinSse arg, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueStructWithGoodAndOpaqueFieldArgOwnTwinSse(
            arg: arg, hint: hint);

Future<void> rustAutoOpaqueStructWithGoodAndOpaqueFieldArgBorrowTwinSse(
        {required StructWithGoodAndOpaqueFieldTwinSse arg, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueStructWithGoodAndOpaqueFieldArgBorrowTwinSse(
            arg: arg, hint: hint);

Future<void> rustAutoOpaqueStructWithGoodAndOpaqueFieldArgMutBorrowTwinSse(
        {required StructWithGoodAndOpaqueFieldTwinSse arg, dynamic hint}) =>
    RustLib.instance.api
        .rustAutoOpaqueStructWithGoodAndOpaqueFieldArgMutBorrowTwinSse(
            arg: arg, hint: hint);

Future<StructWithGoodAndOpaqueFieldTwinSse>
    rustAutoOpaqueStructWithGoodAndOpaqueFieldReturnOwnTwinSse(
            {dynamic hint}) =>
        RustLib.instance.api
            .rustAutoOpaqueStructWithGoodAndOpaqueFieldReturnOwnTwinSse(
                hint: hint);

Future<OpaqueOneTwinSseOpaqueTwoTwinSse>
    rustAutoOpaqueReturnOpaqueOneAndTwoTwinSse({dynamic hint}) =>
        RustLib.instance.api
            .rustAutoOpaqueReturnOpaqueOneAndTwoTwinSse(hint: hint);

Future<OpaqueTwoTwinSse> rustAutoOpaqueReturnOpaqueTwoTwinSse({dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueReturnOpaqueTwoTwinSse(hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<Box<dyn Fn (String) -> String + Send + Sync>>>
@sealed
class BoxFnStringString extends RustOpaque {
  BoxFnStringString.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  BoxFnStringString.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_BoxFnStringString,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_BoxFnStringString,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxFnStringStringPtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<Box<dyn HelloTraitTwinSse>>>
@sealed
class BoxHelloTraitTwinSse extends RustOpaque {
  BoxHelloTraitTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  BoxHelloTraitTwinSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_BoxHelloTraitTwinSse,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxHelloTraitTwinSse,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxHelloTraitTwinSsePtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<Box<dyn MyTraitTwinSse + Send + Sync>>>
@sealed
class BoxMyTraitTwinSse extends RustOpaque {
  BoxMyTraitTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  BoxMyTraitTwinSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_BoxMyTraitTwinSse,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_BoxMyTraitTwinSse,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxMyTraitTwinSsePtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<NonCloneSimpleTwinSse>>
@sealed
class NonCloneSimpleTwinSse extends RustOpaque {
  NonCloneSimpleTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  NonCloneSimpleTwinSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_NonCloneSimpleTwinSse,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_NonCloneSimpleTwinSse,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_NonCloneSimpleTwinSsePtr,
  );

  Future<void> instanceMethodArgBorrowTwinSse({dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseInstanceMethodArgBorrowTwinSse(
        that: this,
      );

  Future<void> instanceMethodArgMutBorrowTwinSse({dynamic hint}) =>
      RustLib.instance.api
          .nonCloneSimpleTwinSseInstanceMethodArgMutBorrowTwinSse(
        that: this,
      );

  Future<void> instanceMethodArgOwnTwinSse({dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseInstanceMethodArgOwnTwinSse(
        that: this,
      );

  Future<int> get instanceMethodGetterTwinSse =>
      RustLib.instance.api.nonCloneSimpleTwinSseInstanceMethodGetterTwinSse(
        that: this,
      );

  Future<NonCloneSimpleTwinSse> instanceMethodReturnOwnTwinSse(
          {dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseInstanceMethodReturnOwnTwinSse(
        that: this,
      );

  /// named constructor
  static Future<NonCloneSimpleTwinSse> newCustomNameTwinSse({dynamic hint}) =>
      RustLib.instance.api
          .nonCloneSimpleTwinSseNewCustomNameTwinSse(hint: hint);

  /// unnamed constructor
  static Future<NonCloneSimpleTwinSse> newTwinSse({dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseNewTwinSse(hint: hint);

  /// constructor with Result
  static Future<NonCloneSimpleTwinSse> newWithResultTwinSse({dynamic hint}) =>
      RustLib.instance.api
          .nonCloneSimpleTwinSseNewWithResultTwinSse(hint: hint);

  static Future<void> staticMethodArgBorrowTwinSse(
          {required NonCloneSimpleTwinSse arg, dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseStaticMethodArgBorrowTwinSse(
          arg: arg, hint: hint);

  static Future<void> staticMethodArgMutBorrowTwinSse(
          {required NonCloneSimpleTwinSse arg, dynamic hint}) =>
      RustLib.instance.api.nonCloneSimpleTwinSseStaticMethodArgMutBorrowTwinSse(
          arg: arg, hint: hint);

  static Future<void> staticMethodArgOwnTwinSse(
          {required NonCloneSimpleTwinSse arg, dynamic hint}) =>
      RustLib.instance.api
          .nonCloneSimpleTwinSseStaticMethodArgOwnTwinSse(arg: arg, hint: hint);

  static Future<NonCloneSimpleTwinSse> staticMethodReturnOwnTwinSse(
          {dynamic hint}) =>
      RustLib.instance.api
          .nonCloneSimpleTwinSseStaticMethodReturnOwnTwinSse(hint: hint);
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<StructWithGoodAndOpaqueFieldTwinSse>>
@sealed
class StructWithGoodAndOpaqueFieldTwinSse extends RustOpaque {
  StructWithGoodAndOpaqueFieldTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  StructWithGoodAndOpaqueFieldTwinSse.sseDecode(
      int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib.instance.api
        .rust_arc_increment_strong_count_StructWithGoodAndOpaqueFieldTwinSse,
    rustArcDecrementStrongCount: RustLib.instance.api
        .rust_arc_decrement_strong_count_StructWithGoodAndOpaqueFieldTwinSse,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_StructWithGoodAndOpaqueFieldTwinSsePtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<(crate::api::pseudo_manual::rust_auto_opaque_twin_sse::OpaqueOneTwinSse,crate::api::pseudo_manual::rust_auto_opaque_twin_sse::OpaqueTwoTwinSse,)>>
@sealed
class OpaqueOneTwinSseOpaqueTwoTwinSse extends RustOpaque {
  OpaqueOneTwinSseOpaqueTwoTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  OpaqueOneTwinSseOpaqueTwoTwinSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib.instance.api
        .rust_arc_increment_strong_count_OpaqueOneTwinSseOpaqueTwoTwinSse,
    rustArcDecrementStrongCount: RustLib.instance.api
        .rust_arc_decrement_strong_count_OpaqueOneTwinSseOpaqueTwoTwinSse,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_OpaqueOneTwinSseOpaqueTwoTwinSsePtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<crate::api::pseudo_manual::rust_auto_opaque_twin_sse::OpaqueTwoTwinSse>>
@sealed
class OpaqueTwoTwinSse extends RustOpaque {
  OpaqueTwoTwinSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  OpaqueTwoTwinSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_OpaqueTwoTwinSse,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_OpaqueTwoTwinSse,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_OpaqueTwoTwinSsePtr,
  );
}
