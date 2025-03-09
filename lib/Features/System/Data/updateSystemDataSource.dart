import 'package:shahabfit/di.dart';
import 'package:shahabfit/constants/url.dart';

Future<String> updateSystem(
    {required String title,
    required String description,
    required String id}) async {
  var body = {
    "title": title,
    "description": description,
    "user": userId,
  };
  try {
    final record = await pb.collection('system').update(id, body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
