// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.78.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated_api_block_1.io.dart' if (dart.library.html) 'bridge_generated_api_block_1.web.dart';
import 'bridge_generated_shares.dart';
export 'bridge_generated_shares.dart';
import 'bridge_generated_shares.io.dart' if (dart.library.html) 'bridge_generated_shares.web.dart';

class ApiBlock1ClassImpl implements ApiBlock1Class {
  final ApiBlock1ClassPlatform _platform;
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  final BridgeGeneratedSharesImpl _sharedImpl;

  factory ApiBlock1ClassImpl(ExternalLibrary dylib) {
    final platform = ApiBlock1ClassPlatform(dylib);
    final sharedPlatform = BridgeGeneratedSharesPlatform(dylib);
    final sharedImpl = BridgeGeneratedSharesImpl(dylib);
    return ApiBlock1ClassImpl.raw(platform, sharedPlatform, sharedImpl);
  }

  ApiBlock1ClassImpl.raw(this._platform, this._sharedPlatform, this._sharedImpl);

  /// Only valid on web/WASM platforms.
  factory ApiBlock1ClassImpl.wasm(FutureOr<WasmModule> module) => ApiBlock1ClassImpl(module as ExternalLibrary);

  Future<double> testInbuiltTypeInBlock1({required int a, required double b, dynamic hint}) {
    var arg0 = api2wire_i32(a);
    var arg1 = api2wire_f32(b);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_inbuilt_type_in_block_1(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_f32,
      constMeta: kTestInbuiltTypeInBlock1ConstMeta,
      argValues: [a, b],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestInbuiltTypeInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_inbuilt_type_in_block_1",
        argNames: ["a", "b"],
      );

  Future<String> testStringInBlock1({required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(s);
    var arg1 = _sharedPlatform.api2wire_u64(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_string_in_block_1(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStringInBlock1ConstMeta,
      argValues: [s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStringInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_string_in_block_1",
        argNames: ["s", "i"],
      );

  String testStringInSyncInBlock1({required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(s);
    var arg1 = _sharedPlatform.api2wire_u64(i);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_test_string_in_sync_in_block_1(arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStringInSyncInBlock1ConstMeta,
      argValues: [s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStringInSyncInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_string_in_sync_in_block_1",
        argNames: ["s", "i"],
      );

  Future<String?> testOptionalStringInBlock1({String? s, required int i, dynamic hint}) {
    var arg0 = _platform.api2wire_opt_String(s);
    var arg1 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_optional_string_in_block_1(port_, arg0, arg1),
      parseSuccessData: _wire2api_opt_String,
      constMeta: kTestOptionalStringInBlock1ConstMeta,
      argValues: [s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestOptionalStringInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_optional_string_in_block_1",
        argNames: ["s", "i"],
      );

  String? testOptionalStringInSyncInBlock1({String? s, required int i, dynamic hint}) {
    var arg0 = _platform.api2wire_opt_String(s);
    var arg1 = api2wire_i32(i);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_test_optional_string_in_sync_in_block_1(arg0, arg1),
      parseSuccessData: _wire2api_opt_String,
      constMeta: kTestOptionalStringInSyncInBlock1ConstMeta,
      argValues: [s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestOptionalStringInSyncInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_optional_string_in_sync_in_block_1",
        argNames: ["s", "i"],
      );

  SharedStructOnlyForSyncTest testSharedStructOnlyForSyncWithSyncReturnInBlock1(
      {required String name, required double score, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(name);
    var arg1 = api2wire_f64(score);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_test_shared_struct_only_for_sync_with_sync_return_in_block_1(arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_shared_struct_only_for_sync_test,
      constMeta: kTestSharedStructOnlyForSyncWithSyncReturnInBlock1ConstMeta,
      argValues: [name, score],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestSharedStructOnlyForSyncWithSyncReturnInBlock1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_shared_struct_only_for_sync_with_sync_return_in_block_1",
        argNames: ["name", "score"],
      );

  Future<SharedStructInAllBlocks> testAllSharedStructInBlock1(
      {required SharedStructInAllBlocks custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_all_blocks(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_all_shared_struct_in_block_1(port_, arg0, arg1, arg2),
      parseSuccessData: (d) => _sharedImpl.wire2api_shared_struct_in_all_blocks(d),
      constMeta: kTestAllSharedStructInBlock1ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestAllSharedStructInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_all_shared_struct_in_block_1",
        argNames: ["custom", "s", "i"],
      );

  Future<SharedStructInBlock1And2> testSharedStructInBlock1For1And2(
      {required SharedStructInBlock1And2 custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_block_1_and_2(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_shared_struct_in_block_1_for_1_and_2(port_, arg0, arg1, arg2),
      parseSuccessData: (d) => _sharedImpl.wire2api_shared_struct_in_block_1_and_2(d),
      constMeta: kTestSharedStructInBlock1For1And2ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestSharedStructInBlock1For1And2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_shared_struct_in_block_1_for_1_and_2",
        argNames: ["custom", "s", "i"],
      );

  Future<String> testCrossSharedStructInBlock1For1And2({required CrossSharedStructInBlock1And2 custom, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_cross_shared_struct_in_block_1_and_2(custom);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_cross_shared_struct_in_block_1_for_1_and_2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestCrossSharedStructInBlock1For1And2ConstMeta,
      argValues: [custom],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestCrossSharedStructInBlock1For1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_cross_shared_struct_in_block_1_for_1_and_2",
        argNames: ["custom"],
      );

  Future<StructOnlyForBlock1> testUniqueStruct1(
      {required StructOnlyForBlock1 custom, required String s, required int i, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_only_for_block_1(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i8(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_unique_struct_1(port_, arg0, arg1, arg2),
      parseSuccessData: (d) => _wire2api_struct_only_for_block_1(d),
      constMeta: kTestUniqueStruct1ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestUniqueStruct1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_unique_struct_1",
        argNames: ["custom", "s", "i"],
      );

  Future<String> testStructDefinedInBlock1({required StructDefinedInBlock1 custom, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_defined_in_block_1(custom);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_struct_defined_in_block_1(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStructDefinedInBlock1ConstMeta,
      argValues: [custom],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStructDefinedInBlock1ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_struct_defined_in_block_1",
        argNames: ["custom"],
      );

  Future<String> testMethodMethodStructDefinedInBlock1(
      {required StructDefinedInBlock1 that, required String message, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_defined_in_block_1(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__StructDefinedInBlock1(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodStructDefinedInBlock1ConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodStructDefinedInBlock1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__StructDefinedInBlock1",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodStructDefinedInBlock1({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__StructDefinedInBlock1(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodStructDefinedInBlock1ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodStructDefinedInBlock1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__StructDefinedInBlock1",
        argNames: ["message"],
      );

  Future<String> testMethodMethodCrossSharedStructInBlock1And2(
      {required CrossSharedStructInBlock1And2 that, required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_cross_shared_struct_in_block_1_and_2(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__CrossSharedStructInBlock1And2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodCrossSharedStructInBlock1And2ConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodCrossSharedStructInBlock1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__CrossSharedStructInBlock1And2",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodCrossSharedStructInBlock1And2({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_test_static_method__static_method__CrossSharedStructInBlock1And2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodCrossSharedStructInBlock1And2ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodCrossSharedStructInBlock1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__CrossSharedStructInBlock1And2",
        argNames: ["message"],
      );

  Future<String> testEnumMethodMethodEnumType({required EnumType that, required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_enum_type(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_enum_method__method__EnumType(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestEnumMethodMethodEnumTypeConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestEnumMethodMethodEnumTypeConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_enum_method__method__EnumType",
        argNames: ["that", "message"],
      );

  Future<String> testStaticEnumMethodStaticMethodEnumType({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_enum_method__static_method__EnumType(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticEnumMethodStaticMethodEnumTypeConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticEnumMethodStaticMethodEnumTypeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_enum_method__static_method__EnumType",
        argNames: ["message"],
      );

  Future<String> testMethodMethodSharedStructInAllBlocks(
      {required SharedStructInAllBlocks that, required String message, required int num, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_all_blocks(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    var arg2 = api2wire_u32(num);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__SharedStructInAllBlocks(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodSharedStructInAllBlocksConstMeta,
      argValues: [that, message, num],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodSharedStructInAllBlocksConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__SharedStructInAllBlocks",
        argNames: ["that", "message", "num"],
      );

  Future<String> testStaticMethodStaticMethodSharedStructInAllBlocks({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__SharedStructInAllBlocks(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodSharedStructInAllBlocksConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodSharedStructInAllBlocksConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__SharedStructInAllBlocks",
        argNames: ["message"],
      );

  Future<String> testMethodMethodSharedStructInBlock1And2(
      {required SharedStructInBlock1And2 that, required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_block_1_and_2(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__SharedStructInBlock1And2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodSharedStructInBlock1And2ConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodSharedStructInBlock1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__SharedStructInBlock1And2",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodSharedStructInBlock1And2({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__SharedStructInBlock1And2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodSharedStructInBlock1And2ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodSharedStructInBlock1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__SharedStructInBlock1And2",
        argNames: ["message"],
      );

  Future<String> testMethodMethodSharedStructOnlyForSyncTest(
      {required SharedStructOnlyForSyncTest that, required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_only_for_sync_test(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__SharedStructOnlyForSyncTest(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodSharedStructOnlyForSyncTestConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodSharedStructOnlyForSyncTestConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__SharedStructOnlyForSyncTest",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodSharedStructOnlyForSyncTest({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_test_static_method__static_method__SharedStructOnlyForSyncTest(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodSharedStructOnlyForSyncTestConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodSharedStructOnlyForSyncTestConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__SharedStructOnlyForSyncTest",
        argNames: ["message"],
      );

  Future<String> testMethodMethodStructOnlyForBlock1(
      {required StructOnlyForBlock1 that, required String message, required int num, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_only_for_block_1(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    var arg2 = api2wire_u16(num);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__StructOnlyForBlock1(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodStructOnlyForBlock1ConstMeta,
      argValues: [that, message, num],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodStructOnlyForBlock1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__StructOnlyForBlock1",
        argNames: ["that", "message", "num"],
      );

  Future<String> testStaticMethodStaticMethodStructOnlyForBlock1({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__StructOnlyForBlock1(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodStructOnlyForBlock1ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodStructOnlyForBlock1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__StructOnlyForBlock1",
        argNames: ["message"],
      );

  Future<String> testEnumMethodMethodWeekdays({required Weekdays that, required String message, dynamic hint}) {
    var arg0 = api2wire_weekdays(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_enum_method__method__Weekdays(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestEnumMethodMethodWeekdaysConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestEnumMethodMethodWeekdaysConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_enum_method__method__Weekdays",
        argNames: ["that", "message"],
      );

  Future<String> testStaticEnumMethodStaticMethodWeekdays({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_enum_method__static_method__Weekdays(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticEnumMethodStaticMethodWeekdaysConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticEnumMethodStaticMethodWeekdaysConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_enum_method__static_method__Weekdays",
        argNames: ["message"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  int _wire2api_box_autoadd_i8(dynamic raw) {
    return raw as int;
  }

  int _wire2api_i8(dynamic raw) {
    return raw as int;
  }

  String? _wire2api_opt_String(dynamic raw) {
    return raw == null ? null : _sharedImpl.wire2api_String(raw);
  }

  double? _wire2api_opt_box_autoadd_f64(dynamic raw) {
    return raw == null ? null : _sharedImpl.wire2api_box_autoadd_f64(raw);
  }

  int? _wire2api_opt_box_autoadd_i8(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_i8(raw);
  }

  StructOnlyForBlock1 _wire2api_struct_only_for_block_1(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return StructOnlyForBlock1(
      bridge: this,
      id: _wire2api_opt_box_autoadd_i8(arr[0]),
      num: _wire2api_opt_box_autoadd_f64(arr[1]),
      name: _wire2api_opt_String(arr[2]),
    );
  }
}

// Section: api2wire

@protected
int api2wire_i8(int raw) {
  return raw;
}

// Section: finalizer
