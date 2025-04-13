import 'dart:convert';
import 'dart:js_interop';

import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/webauthn_interop.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> authenticateFingerprint() async {
  try {
    final res = authenticateWithFingerprint();
    final credResult = await res.toDart;
    final json = jsonDecode(credResult.toString());
    final String receivedCredId = json['credentialId'];
    final user = await pb
        .collection('users')
        .getFirstListItem('credentialId=$receivedCredId');

    if (user.data['credentialId'] == receivedCredId) {
      await pb.collection('users').authWithPassword(
            user.getStringValue("phone"),
            password,
          );
      print("✅ ورود با اثر انگشت موفقیت‌آمیز بود");
    } else {
      print("❌ اثر انگشت یا اطلاعات کاربر معتبر نیست");
    }
  } catch (e) {
    print("❌ خطا هنگام ورود با اثر انگشت: $e");
  }
}
