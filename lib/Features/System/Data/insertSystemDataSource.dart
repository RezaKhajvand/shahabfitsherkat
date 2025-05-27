import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> insertSystem(
    {required String title, required String description}) async {
  var body = {
    "title": title,
    "description": description,
  "user": AuthManager.readUser(),
  };
  try {
    final record = await pb.collection('system').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
