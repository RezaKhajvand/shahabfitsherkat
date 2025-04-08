import 'dart:js_interop';

import 'webauthn_interop.dart';

Future<void> registerThenAuth() async {
  print("👣 شروع ثبت اثر انگشت...");

  final reg = registerFingerprintCredential();
  if (reg is JSPromise) {
    try {
      final regResult = await reg.toDart;
      print("✅ ثبت موفق: $regResult");
    } catch (err) {
      print("❌ خطا در ثبت یا auth: $err");
    }
  } else {
    print("❌ register معتبر نبود");
  }
}
