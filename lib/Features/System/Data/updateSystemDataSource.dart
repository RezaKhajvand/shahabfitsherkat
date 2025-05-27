import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> updateSystem(
    {required String title,
    required String description,
    required String id}) async {
  var body = {
    "title": title,
    "description": description,
    "user": AuthManager.readUser(),
  };
  try {
    final record = await pb.collection('system').update(id, body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
