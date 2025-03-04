import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

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
