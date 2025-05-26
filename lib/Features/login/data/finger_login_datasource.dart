import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/constants/pb.dart';

Future<RecordAuth> fingerLogin({required String credentialId}) async {
  final authData = await pb.send(
    '/api/finger-login',
    method: "POST",
    body: {"credentialId": "AdtRmYM2VoAmbIG9OGiLxO2n4OtZbtSiMnX-W2tT7Bx-RSugkS_M3I6cMZJHnYKNsRZLXREB2vmfGrqKqq_OXMM"},
  );
  return RecordAuth.fromJson(authData);
}
