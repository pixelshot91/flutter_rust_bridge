// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'exception.freezed.dart';

Future<int> funcReturnErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.funcReturnErrorTwinNormal(hint: hint);

Future<int> funcTypeFalliblePanicTwinNormal({dynamic hint}) =>
    RustLib.instance.api.funcTypeFalliblePanicTwinNormal(hint: hint);

Future<int> funcTypeInfalliblePanicTwinNormal({dynamic hint}) =>
    RustLib.instance.api.funcTypeInfalliblePanicTwinNormal(hint: hint);

Future<int> customEnumErrorReturnOkTwinNormal(
        {required int arg, dynamic hint}) =>
    RustLib.instance.api
        .customEnumErrorReturnOkTwinNormal(arg: arg, hint: hint);

Future<void> customEnumErrorPanicTwinNormal({dynamic hint}) =>
    RustLib.instance.api.customEnumErrorPanicTwinNormal(hint: hint);

Future<int> customEnumErrorReturnErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.customEnumErrorReturnErrorTwinNormal(hint: hint);

Future<void> customNestedErrorReturnErrorTwinNormal(
        {required CustomNestedErrorOuterTwinNormal arg, dynamic hint}) =>
    RustLib.instance.api
        .customNestedErrorReturnErrorTwinNormal(arg: arg, hint: hint);

Future<void> customStructErrorReturnErrorTwinNormal(
        {required CustomStructErrorTwinNormal arg, dynamic hint}) =>
    RustLib.instance.api
        .customStructErrorReturnErrorTwinNormal(arg: arg, hint: hint);

Future<int> returnErrCustomErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnErrCustomErrorTwinNormal(hint: hint);

Future<int> returnOkCustomErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnOkCustomErrorTwinNormal(hint: hint);

Future<int> returnErrorVariantTwinNormal(
        {required int variant, dynamic hint}) =>
    RustLib.instance.api
        .returnErrorVariantTwinNormal(variant: variant, hint: hint);

Future<void> returnCustomNestedError1TwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnCustomNestedError1TwinNormal(hint: hint);

Future<void> returnCustomNestedError1Variant1TwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnCustomNestedError1Variant1TwinNormal(hint: hint);

Future<void> returnCustomNestedError2TwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnCustomNestedError2TwinNormal(hint: hint);

Future<void> returnCustomStructErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnCustomStructErrorTwinNormal(hint: hint);

Future<int> returnCustomStructOkTwinNormal({dynamic hint}) =>
    RustLib.instance.api.returnCustomStructOkTwinNormal(hint: hint);

Future<void> throwAnyhowTwinNormal({dynamic hint}) =>
    RustLib.instance.api.throwAnyhowTwinNormal(hint: hint);

Future<void> panicWithCustomResultTwinNormal({dynamic hint}) =>
    RustLib.instance.api.panicWithCustomResultTwinNormal(hint: hint);

Stream<String> streamSinkThrowAnyhowTwinNormal({dynamic hint}) =>
    RustLib.instance.api.streamSinkThrowAnyhowTwinNormal(hint: hint);

@freezed
sealed class CustomEnumErrorTwinNormal
    with _$CustomEnumErrorTwinNormal
    implements FrbException {
  @Implements<FrbBacktracedException>()
  const factory CustomEnumErrorTwinNormal.one({
    required String message,
    required String backtrace,
  }) = CustomEnumErrorTwinNormal_One;
  @Implements<FrbBacktracedException>()
  const factory CustomEnumErrorTwinNormal.two({
    required int message,
    required String backtrace,
  }) = CustomEnumErrorTwinNormal_Two;
}

@freezed
sealed class CustomErrorTwinNormal
    with _$CustomErrorTwinNormal
    implements FrbException {
  @Implements<FrbBacktracedException>()
  const factory CustomErrorTwinNormal.error0({
    required String e,
    required String backtrace,
  }) = CustomErrorTwinNormal_Error0;
  @Implements<FrbBacktracedException>()
  const factory CustomErrorTwinNormal.error1({
    required int e,
    required String backtrace,
  }) = CustomErrorTwinNormal_Error1;
}

@freezed
sealed class CustomNestedError1TwinNormal
    with _$CustomNestedError1TwinNormal
    implements FrbException {
  const factory CustomNestedError1TwinNormal.customNested1(
    String field0,
  ) = CustomNestedError1TwinNormal_CustomNested1;
  const factory CustomNestedError1TwinNormal.errorNested(
    CustomNestedError2TwinNormal field0,
  ) = CustomNestedError1TwinNormal_ErrorNested;
}

@freezed
sealed class CustomNestedError2TwinNormal with _$CustomNestedError2TwinNormal {
  const factory CustomNestedError2TwinNormal.customNested2(
    String field0,
  ) = CustomNestedError2TwinNormal_CustomNested2;
  const factory CustomNestedError2TwinNormal.customNested2Number(
    int field0,
  ) = CustomNestedError2TwinNormal_CustomNested2Number;
}

@freezed
sealed class CustomNestedErrorInnerTwinNormal
    with _$CustomNestedErrorInnerTwinNormal {
  const factory CustomNestedErrorInnerTwinNormal.three(
    String field0,
  ) = CustomNestedErrorInnerTwinNormal_Three;
  const factory CustomNestedErrorInnerTwinNormal.four(
    int field0,
  ) = CustomNestedErrorInnerTwinNormal_Four;
}

@freezed
sealed class CustomNestedErrorOuterTwinNormal
    with _$CustomNestedErrorOuterTwinNormal {
  const factory CustomNestedErrorOuterTwinNormal.one(
    String field0,
  ) = CustomNestedErrorOuterTwinNormal_One;
  const factory CustomNestedErrorOuterTwinNormal.two(
    CustomNestedErrorInnerTwinNormal field0,
  ) = CustomNestedErrorOuterTwinNormal_Two;
}

class CustomStructErrorAnotherTwinNormal implements FrbException {
  final String message;

  const CustomStructErrorAnotherTwinNormal({
    required this.message,
  });

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructErrorAnotherTwinNormal &&
          runtimeType == other.runtimeType &&
          message == other.message;
}

class CustomStructErrorTwinNormal {
  final String a;

  const CustomStructErrorTwinNormal({
    required this.a,
  });

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructErrorTwinNormal &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class CustomStructTwinNormal {
  final String message;

  const CustomStructTwinNormal({
    required this.message,
  });

  static Future<CustomStructTwinNormal> newTwinNormal(
          {required String message, dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinNormalNewTwinNormal(message: message, hint: hint);

  Future<void> nonstaticReturnCustomStructErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinNormalNonstaticReturnCustomStructErrorTwinNormal(
        that: this,
      );

  Future<int> nonstaticReturnCustomStructOkTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinNormalNonstaticReturnCustomStructOkTwinNormal(
        that: this,
      );

  static Future<void> staticReturnCustomStructErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinNormalStaticReturnCustomStructErrorTwinNormal(
              hint: hint);

  static Future<int> staticReturnCustomStructOkTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinNormalStaticReturnCustomStructOkTwinNormal(
              hint: hint);

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructTwinNormal &&
          runtimeType == other.runtimeType &&
          message == other.message;
}

class SomeStructTwinNormal {
  final int value;

  const SomeStructTwinNormal({
    required this.value,
  });

  static Future<SomeStructTwinNormal> newTwinNormal(
          {required int value, dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinNormalNewTwinNormal(value: value, hint: hint);

  Future<int> nonStaticReturnErrCustomErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinNormalNonStaticReturnErrCustomErrorTwinNormal(
        that: this,
      );

  Future<int> nonStaticReturnOkCustomErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinNormalNonStaticReturnOkCustomErrorTwinNormal(
        that: this,
      );

  static Future<int> staticReturnErrCustomErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinNormalStaticReturnErrCustomErrorTwinNormal(hint: hint);

  static Future<int> staticReturnOkCustomErrorTwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinNormalStaticReturnOkCustomErrorTwinNormal(hint: hint);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeStructTwinNormal &&
          runtimeType == other.runtimeType &&
          value == other.value;
}
