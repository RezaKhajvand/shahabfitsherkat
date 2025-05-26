import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/constants/pb.dart';

Future<RecordAuth> fingerLogin({required String credentialId}) async {
  final authData = await pb.send(
    '/api/finger-login',
    method: "POST",
    body: {"credentialId": credentialId},
  );
  return RecordAuth.fromJson(authData);
}
