import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> insertSystem(
    {required String title, required String description}) async {
  var body = {
    "title": title,
    "description": description,
    "user": userId,
  };
  try {
    final record = await pb.collection('system').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
