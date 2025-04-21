
import 'dart:js_interop';


import 'package:shahabfit/Features/login/data/finger_login_datasource.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/webauthn_interop.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> registerFingerprint() async {
  final id = AuthManager.readUser()!;
  try {
    final res = registerFingerprintCredential();
    final credId = await res.toDart;
    await AuthManager.saveFinger(credId.toString());
    final body = {"credentialId": credId};
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

Future<void> loginWithFingerprint() async {
  final credentialId = AuthManager.readFinger();
  if (credentialId == null) {
    print("❌ credentialId یافت نشد");
    return;
  }

  final res = authenticateWithFingerprint(credentialId);
  final result = await res.toDart;

  if (result.toString() == "ok") {
    print("✅ ورود موفق با اثر انگشت");
    await fingerLogin(credentialId: credentialId);
  } else {
    print("❌ خطا در ورود: ${result.toString()}");
  }
}
