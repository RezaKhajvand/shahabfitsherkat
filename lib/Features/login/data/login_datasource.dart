import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/constants/url.dart';

Future<RecordAuth> login(
    {required String phone, required String password}) async {
  final authData =
      await pb.collection('users').authWithPassword(phone, password);
  return authData;
}
