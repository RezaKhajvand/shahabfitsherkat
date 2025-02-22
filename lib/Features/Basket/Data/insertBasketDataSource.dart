import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Di.dart';

Future<String> insertBasket() async {
  final body = {
    "name": 'name',
    "isOpen": true,
    "user": userId,
  };
  try {
    final record = await pb.collection('basket').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
