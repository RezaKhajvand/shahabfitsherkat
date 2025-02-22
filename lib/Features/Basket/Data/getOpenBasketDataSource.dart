import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> getOpenBasket() async {
  try {
    final records =
        await pb.collection('basket').getFullList(filter: 'isOpen=true');

    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
