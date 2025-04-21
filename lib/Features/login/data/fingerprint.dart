import 'dart:convert';
import 'dart:js_interop';

import 'package:shahabfit/Features/login/data/finger_login_datasource.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/webauthn_interop.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> registerFingerprint() async {
  final id = AuthManager.readUser()!;
  try {
    final res = registerFingerprintCredential();
    final credResult = await res.toDart;
    final json = jsonDecode(credResult.toString());
    final credentialId = json['id']; // ✅ اصلاح شد
    await AuthManager.saveFinger(credentialId);
    final body = <String, dynamic>{
      "credentialId": credentialId,
    };
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
    final result = authenticateWithFingerprint(AuthManager.readFinger());
    final credResult = await result.toDart;
    final json = jsonDecode(credResult.toString());
    final credentialId = json['id'];
    await fingerLogin(credentialId: credentialId);
    print("✅ احراز هویت با اثر انگشت موفق بود: $credentialId");
    return credentialId;
  } catch (e) {
    print("❌ استثنا هنگام لاگین با اثر انگشت: $e");
    rethrow;
  }
}
