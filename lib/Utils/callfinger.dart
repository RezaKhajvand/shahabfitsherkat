import 'dart:js_interop' as web;

import 'webauthn_interop.dart';

void doAuth() {
  final result = authenticateWithFingerprint();

  if (result is web.JSPromise) {
    result.toDart.then((value) {
      print('✅ نتیجه: $value');
    }).onError((err, stack) {
      print('❌ خطا: $err');
    });
  } else {
    print('❗ نتیجه نا معتبر بود: $result');
  }
}
