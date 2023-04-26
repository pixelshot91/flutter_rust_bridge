// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated_shares.io.dart' if (dart.library.html) 'bridge_generated_shares.web.dart';
import 'bridge_generated_shares.dart';
export 'bridge_generated_shares.dart';
import 'bridge_generated_shares.io.dart' if (dart.library.html) 'bridge_generated_shares.web.dart';

abstract class BridgeGeneratedShares {}

/// this struct is used only as parameter in API block1 and used only as return type in API block2, but not
/// defined in either block file
class CrossSharedStructInBlock1And2 {
  final String name;

  const CrossSharedStructInBlock1And2({
    required this.name,
  });
}

/// this struct is used only as parameter in API block2 and used only as return type in API block3, but not
/// defined in either block file
class CrossSharedStructInBlock2And3 {
  final String name;

  const CrossSharedStructInBlock2And3({
    required this.name,
  });
}

/// This is a struct used in ALL API blocks, NOT defined in any regular block file
class SharedStructInAllBlocks {
  final int id;
  final double num;
  final String name;

  const SharedStructInAllBlocks({
    required this.id,
    required this.num,
    required this.name,
  });
}

/// This is a struct used in API blocks 1 and 2 for test, but not defined in any regular block file
class SharedStructInBlock1And2 {
  final int id;
  final double num;
  final String name;

  const SharedStructInBlock1And2({
    required this.id,
    required this.num,
    required this.name,
  });
}

/// This is a struct used in all API blocks 2 and 3 for test, but not defined in any regular block file
class SharedStructInBlock2And3 {
  final int id;
  final double num;
  final String name;

  const SharedStructInBlock2And3({
    required this.id,
    required this.num,
    required this.name,
  });
}

class BridgeGeneratedSharesImpl implements BridgeGeneratedShares {
  final BridgeGeneratedSharesPlatform _platform;
  factory BridgeGeneratedSharesImpl(ExternalLibrary dylib) =>
      BridgeGeneratedSharesImpl.raw(BridgeGeneratedSharesPlatform(dylib));
  BridgeGeneratedSharesImpl.raw(this._platform);

  /// Only valid on web/WASM platforms.
  factory BridgeGeneratedSharesImpl.wasm(FutureOr<WasmModule> module) =>
      BridgeGeneratedSharesImpl(module as ExternalLibrary);

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String wire2api_String(dynamic raw) {
    return raw as String;
  }

  CrossSharedStructInBlock1And2 wire2api_cross_shared_struct_in_block_1_and_2(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1) throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return CrossSharedStructInBlock1And2(
      name: wire2api_String(arr[0]),
    );
  }

  CrossSharedStructInBlock2And3 wire2api_cross_shared_struct_in_block_2_and_3(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1) throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return CrossSharedStructInBlock2And3(
      name: wire2api_String(arr[0]),
    );
  }

  double wire2api_f32(dynamic raw) {
    return raw as double;
  }

  double wire2api_f64(dynamic raw) {
    return raw as double;
  }

  int wire2api_i32(dynamic raw) {
    return raw as int;
  }

  SharedStructInAllBlocks wire2api_shared_struct_in_all_blocks(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return SharedStructInAllBlocks(
      id: wire2api_i32(arr[0]),
      num: wire2api_f64(arr[1]),
      name: wire2api_String(arr[2]),
    );
  }

  SharedStructInBlock1And2 wire2api_shared_struct_in_block_1_and_2(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return SharedStructInBlock1And2(
      id: wire2api_i32(arr[0]),
      num: wire2api_f64(arr[1]),
      name: wire2api_String(arr[2]),
    );
  }

  SharedStructInBlock2And3 wire2api_shared_struct_in_block_2_and_3(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return SharedStructInBlock2And3(
      id: wire2api_i32(arr[0]),
      num: wire2api_f64(arr[1]),
      name: wire2api_String(arr[2]),
    );
  }

  int wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
double api2wire_f32(double raw) {
  return raw;
}

@protected
double api2wire_f64(double raw) {
  return raw;
}

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer
