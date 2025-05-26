import 'dart:convert';
import 'dart:js_interop';

import 'package:pocketbase/pocketbase.dart';
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
    final credentialId = json['id'];
    final body = {"credentialId": credentialId};
    await pb.collection('users').update(id, body: body);
    await AuthManager.saveFinger(credentialId);
    print("✅ اثر انگشت برای کاربر $id ثبت شد");
  } catch (e) {
    print("❌ خطا در ثبت اثر انگشت: $e");
  }
}

Future<RecordAuth> loginWithFingerprint() async {
  final String finger = AuthManager.readFinger() ?? '';
  try {
    // final result = authenticateWithFingerprint(finger);
    // final credResult = await result.toDart;
    // if (credResult.toString() == "ok") {
    final auth = await fingerLogin(credentialId: finger);
    return auth;
    // } else {
    //   throw ClientException(
    //       statusCode: 400, response: {'message': " ${credResult.toString()}"});
    // }
  } catch (e) {
    print(e);
    throw ClientException(statusCode: 400, response: {'message': e.toString()});
  }
}
