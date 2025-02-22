import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<void> deleteBasket({required String record}) async {
  try {
    await pb.collection('basket').delete(record);
  } catch (e) {
    rethrow;
  }
}
