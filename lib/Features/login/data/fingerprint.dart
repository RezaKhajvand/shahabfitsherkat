import 'dart:convert';
import 'dart:js_interop';

import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/webauthn_interop.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> registerFingerprint() async {
  final id = AuthManager.readUser()!;
  try {
    final res = registerFingerprintCredential();
    final credResult = await res.toDart;
    final json = jsonDecode(credResult.toString());
    final body = <String, dynamic>{"credentialId": json['credentialId']};
    await pb.collection('users').update(
          id,
          body: body,
          headers: AuthManager.readHeader(),
        );
    print("✅ اثر انگشت برای کاربر $id ثبت شد");
  } catch (e) {
    print("❌ خطا در ثبت اثر انگشت: $e");
  }
}

Future<String> loginWithFingerprint() async {
  try {
    final result = authenticateWithFingerprint();
    final credResult = await result.toDart;
    final json = jsonDecode(credResult.toString());

    print("✅ احراز هویت با اثر انگشت موفق بود");
    return json['credentialId'];
  } catch (e) {
    print("❌ استثنا هنگام لاگین با اثر انگشت: $e");
    rethrow;
  }
}
