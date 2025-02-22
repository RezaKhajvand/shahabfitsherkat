import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> getCategory() async {
  try {
    final records = await pb.collection('category').getFullList();
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
