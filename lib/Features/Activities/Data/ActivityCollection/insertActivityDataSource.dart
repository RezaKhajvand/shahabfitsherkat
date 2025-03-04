import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> insertActivity({
  required String catId,
  required String title,
}) async {
  var body = {
    "title": title,
    "catId": catId,
    "user": userId,
  };
  try {
    final record = await pb.collection('activity').create(body: body);

    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
