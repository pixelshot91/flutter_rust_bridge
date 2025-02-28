import 'package:frb_example_pure_dart/src/rust/api/primitive_misc.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

// NOTE majority of tests are in `pseudo_manual/*`
Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  test('dart call primitiveTypes', () async {
    expect(
        await primitiveTypesTwinNormal(
            myI32: 123,
            myI64: 10000000000000,
            myF64: 12345678901234567890.123,
            myBool: true),
        42);
  });

  test('dart call primitiveU32', () async {
    expect(await primitiveU32TwinNormal(myU32: 0xff112233), 0xfe112233);
  });

  addTestsIdentityFunctionCall(primitiveUsizeLoopbackTwinNormal, <int>[0, 100]);
  addTestsIdentityFunctionCall(
      primitiveIsizeLoopbackTwinNormal, <int>[0, 100, -100]);
}
