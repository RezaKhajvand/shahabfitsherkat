import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> getSystem() async {
  try {
    final records = await pb
        .collection('system')
        .getFullList(filter: '(user="$userId"||user="")');
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
