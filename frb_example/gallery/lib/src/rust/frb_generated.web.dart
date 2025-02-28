// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/mandelbrot.dart';
import 'api/polars.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_DataFramePtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockDataFrame;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_ExprPtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockExpr;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_LazyFramePtr =>
      wire.rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyFrame;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_LazyGroupByPtr => wire
          .rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  DataFrame dco_decode_Auto_Owned_RustOpaque_stdsyncRwLockDataFrame(
      dynamic raw);

  @protected
  Expr dco_decode_Auto_Owned_RustOpaque_stdsyncRwLockExpr(dynamic raw);

  @protected
  LazyFrame dco_decode_Auto_Owned_RustOpaque_stdsyncRwLockLazyFrame(
      dynamic raw);

  @protected
  LazyGroupBy dco_decode_Auto_Owned_RustOpaque_stdsyncRwLockLazyGroupBy(
      dynamic raw);

  @protected
  DataFrame dco_decode_Auto_Ref_RustOpaque_stdsyncRwLockDataFrame(dynamic raw);

  @protected
  DataFrame dco_decode_RustOpaque_stdsyncRwLockDataFrame(dynamic raw);

  @protected
  Expr dco_decode_RustOpaque_stdsyncRwLockExpr(dynamic raw);

  @protected
  LazyFrame dco_decode_RustOpaque_stdsyncRwLockLazyFrame(dynamic raw);

  @protected
  LazyGroupBy dco_decode_RustOpaque_stdsyncRwLockLazyGroupBy(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  Point dco_decode_box_autoadd_point(dynamic raw);

  @protected
  Size dco_decode_box_autoadd_size(dynamic raw);

  @protected
  double dco_decode_f_64(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  List<String> dco_decode_list_String(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  Point dco_decode_point(dynamic raw);

  @protected
  Size dco_decode_size(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  DataFrame sse_decode_Auto_Owned_RustOpaque_stdsyncRwLockDataFrame(
      SseDeserializer deserializer);

  @protected
  Expr sse_decode_Auto_Owned_RustOpaque_stdsyncRwLockExpr(
      SseDeserializer deserializer);

  @protected
  LazyFrame sse_decode_Auto_Owned_RustOpaque_stdsyncRwLockLazyFrame(
      SseDeserializer deserializer);

  @protected
  LazyGroupBy sse_decode_Auto_Owned_RustOpaque_stdsyncRwLockLazyGroupBy(
      SseDeserializer deserializer);

  @protected
  DataFrame sse_decode_Auto_Ref_RustOpaque_stdsyncRwLockDataFrame(
      SseDeserializer deserializer);

  @protected
  DataFrame sse_decode_RustOpaque_stdsyncRwLockDataFrame(
      SseDeserializer deserializer);

  @protected
  Expr sse_decode_RustOpaque_stdsyncRwLockExpr(SseDeserializer deserializer);

  @protected
  LazyFrame sse_decode_RustOpaque_stdsyncRwLockLazyFrame(
      SseDeserializer deserializer);

  @protected
  LazyGroupBy sse_decode_RustOpaque_stdsyncRwLockLazyGroupBy(
      SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  Point sse_decode_box_autoadd_point(SseDeserializer deserializer);

  @protected
  Size sse_decode_box_autoadd_size(SseDeserializer deserializer);

  @protected
  double sse_decode_f_64(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  Point sse_decode_point(SseDeserializer deserializer);

  @protected
  Size sse_decode_size(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  String cst_encode_AnyhowException(AnyhowException raw) {
    throw UnimplementedError();
  }

  @protected
  String cst_encode_String(String raw) {
    return raw;
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_point(Point raw) {
    return cst_encode_point(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_size(Size raw) {
    return cst_encode_size(raw);
  }

  @protected
  List<dynamic> cst_encode_list_String(List<String> raw) {
    return raw.map(cst_encode_String).toList();
  }

  @protected
  Uint8List cst_encode_list_prim_u_8_strict(Uint8List raw) {
    return raw;
  }

  @protected
  List<dynamic> cst_encode_point(Point raw) {
    return [cst_encode_f_64(raw.x), cst_encode_f_64(raw.y)];
  }

  @protected
  List<dynamic> cst_encode_size(Size raw) {
    return [cst_encode_i_32(raw.width), cst_encode_i_32(raw.height)];
  }

  @protected
  PlatformPointer cst_encode_Auto_Owned_RustOpaque_stdsyncRwLockDataFrame(
      DataFrame raw);

  @protected
  PlatformPointer cst_encode_Auto_Owned_RustOpaque_stdsyncRwLockExpr(Expr raw);

  @protected
  PlatformPointer cst_encode_Auto_Owned_RustOpaque_stdsyncRwLockLazyFrame(
      LazyFrame raw);

  @protected
  PlatformPointer cst_encode_Auto_Owned_RustOpaque_stdsyncRwLockLazyGroupBy(
      LazyGroupBy raw);

  @protected
  PlatformPointer cst_encode_Auto_Ref_RustOpaque_stdsyncRwLockDataFrame(
      DataFrame raw);

  @protected
  PlatformPointer cst_encode_RustOpaque_stdsyncRwLockDataFrame(DataFrame raw);

  @protected
  PlatformPointer cst_encode_RustOpaque_stdsyncRwLockExpr(Expr raw);

  @protected
  PlatformPointer cst_encode_RustOpaque_stdsyncRwLockLazyFrame(LazyFrame raw);

  @protected
  PlatformPointer cst_encode_RustOpaque_stdsyncRwLockLazyGroupBy(
      LazyGroupBy raw);

  @protected
  double cst_encode_f_64(double raw);

  @protected
  int cst_encode_i_32(int raw);

  @protected
  int cst_encode_u_8(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  int cst_encode_usize(int raw);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void sse_encode_Auto_Owned_RustOpaque_stdsyncRwLockDataFrame(
      DataFrame self, SseSerializer serializer);

  @protected
  void sse_encode_Auto_Owned_RustOpaque_stdsyncRwLockExpr(
      Expr self, SseSerializer serializer);

  @protected
  void sse_encode_Auto_Owned_RustOpaque_stdsyncRwLockLazyFrame(
      LazyFrame self, SseSerializer serializer);

  @protected
  void sse_encode_Auto_Owned_RustOpaque_stdsyncRwLockLazyGroupBy(
      LazyGroupBy self, SseSerializer serializer);

  @protected
  void sse_encode_Auto_Ref_RustOpaque_stdsyncRwLockDataFrame(
      DataFrame self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_stdsyncRwLockDataFrame(
      DataFrame self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_stdsyncRwLockExpr(
      Expr self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_stdsyncRwLockLazyFrame(
      LazyFrame self, SseSerializer serializer);

  @protected
  void sse_encode_RustOpaque_stdsyncRwLockLazyGroupBy(
      LazyGroupBy self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_point(Point self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_size(Size self, SseSerializer serializer);

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_point(Point self, SseSerializer serializer);

  @protected
  void sse_encode_size(Size self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire extends BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);

  void dart_fn_deliver_output(int call_id, PlatformGeneralizedUint8ListPtr ptr_,
          int rust_vec_len_, int data_len_) =>
      wasmModule.dart_fn_deliver_output(
          call_id, ptr_, rust_vec_len_, data_len_);

  void wire_draw_mandelbrot(NativePortType port_, List<dynamic> image_size,
          List<dynamic> zoom_point, double scale, int num_threads) =>
      wasmModule.wire_draw_mandelbrot(
          port_, image_size, zoom_point, scale, num_threads);

  void wire_DataFrame_get_column(
          NativePortType port_, Object that, String name) =>
      wasmModule.wire_DataFrame_get_column(port_, that, name);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_DataFrame_get_column_names(Object that) =>
          wasmModule.wire_DataFrame_get_column_names(that);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_DataFrame_lazy(Object that) => wasmModule.wire_DataFrame_lazy(that);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_Expr_gt(Object that, Object other) =>
          wasmModule.wire_Expr_gt(that, other);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_Expr_sum(Object that) => wasmModule.wire_Expr_sum(that);

  void wire_LazyFrame_collect(NativePortType port_, Object that) =>
      wasmModule.wire_LazyFrame_collect(port_, that);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyFrame_filter(Object that, Object predicate) =>
          wasmModule.wire_LazyFrame_filter(that, predicate);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyFrame_group_by(Object that, Object expr) =>
          wasmModule.wire_LazyFrame_group_by(that, expr);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyGroupBy_agg(Object that, Object expr) =>
          wasmModule.wire_LazyGroupBy_agg(that, expr);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_col(String name) => wasmModule.wire_col(name);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_lit(double t) => wasmModule.wire_lit(t);

  void wire_read_sample_dataset(NativePortType port_) =>
      wasmModule.wire_read_sample_dataset(port_);

  void rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockDataFrame(
          dynamic ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockDataFrame(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockDataFrame(
          dynamic ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockDataFrame(
              ptr);

  void rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockExpr(
          dynamic ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockExpr(ptr);

  void rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockExpr(
          dynamic ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockExpr(ptr);

  void rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
          dynamic ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
          dynamic ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
              ptr);

  void rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
          dynamic ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
          dynamic ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
              ptr);
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS()
@anonymous
class RustLibWasmModule implements WasmModule {
  @override
  external Object /* Promise */ call([String? moduleName]);

  @override
  external RustLibWasmModule bind(dynamic thisArg, String moduleName);

  external void dart_fn_deliver_output(int call_id,
      PlatformGeneralizedUint8ListPtr ptr_, int rust_vec_len_, int data_len_);

  external void wire_draw_mandelbrot(
      NativePortType port_,
      List<dynamic> image_size,
      List<dynamic> zoom_point,
      double scale,
      int num_threads);

  external void wire_DataFrame_get_column(
      NativePortType port_, Object that, String name);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_DataFrame_get_column_names(Object that);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_DataFrame_lazy(Object that);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_Expr_gt(Object that, Object other);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_Expr_sum(Object that);

  external void wire_LazyFrame_collect(NativePortType port_, Object that);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyFrame_filter(Object that, Object predicate);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyFrame_group_by(Object that, Object expr);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_LazyGroupBy_agg(Object that, Object expr);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_col(String name);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_lit(double t);

  external void wire_read_sample_dataset(NativePortType port_);

  external void
      rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockDataFrame(
          dynamic ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockDataFrame(
          dynamic ptr);

  external void rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockExpr(
      dynamic ptr);

  external void rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockExpr(
      dynamic ptr);

  external void
      rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
          dynamic ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyFrame(
          dynamic ptr);

  external void
      rust_arc_increment_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
          dynamic ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_stdsyncRwLockLazyGroupBy(
          dynamic ptr);
}
