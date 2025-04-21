import 'dart:convert';
import 'dart:js_interop';

import 'package:shahabfit/Features/login/data/finger_login_datasource.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/webauthn_interop.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> registerFingerprint() async {
  final id = AuthManager.readUser()!;
  try {
    final res = registerFingerprintCredential();
    final credResult = await res.toDart;
    final json = jsonDecode(credResult.toString());
    final credentialId = json['id'];
    final body = {"credentialId": credentialId};
    await pb
        .collection('users')
        .update(id, body: body, headers: AuthManager.readHeader());
    await AuthManager.saveFinger(credentialId);
    print("✅ اثر انگشت برای کاربر $id ثبت شد");
  } catch (e) {
    print("❌ خطا در ثبت اثر انگشت: $e");
  }
}

Future<void> loginWithFingerprint() async {
  final finger = AuthManager.readFinger();
  if (finger == null) {
    throw CustomException('اثر انگشت تعریف نشده است');
  }
  try {
    final result = authenticateWithFingerprint(finger);
    final credResult = await result.toDart;
    if (credResult.toString() == "ok") {
      print("✅ورود موفق با اثر انگشت");
      await fingerLogin();
    } else {
      print("❌ خطا در اثر انگشت: ${result.toString()}");
      throw CustomException('❌ خطا در اثر انگشت: ${result.toString()}');
    }
  } catch (e) {
    print("❌ استثنا هنگام لاگین با اثر انگشت: $e");
    rethrow;
  }
}
