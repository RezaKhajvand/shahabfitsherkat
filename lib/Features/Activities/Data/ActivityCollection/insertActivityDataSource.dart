import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> insertActivity({
  required String catId,
  required String title,
}) async {
  var body = {
    "title": title,
    "catId": catId,
    "user": AuthManager.readUser(),
  };
  try {
    final record = await pb.collection('activity').create(body: body);

    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
