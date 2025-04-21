import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<RecordAuth> fingerLogin() async {
  final authData = await pb.send('/api/finger-login',
      method: "POST", body: {"credentialId": AuthManager.readFinger()});
  print(authData);
  return RecordAuth.fromJson(authData);
}
