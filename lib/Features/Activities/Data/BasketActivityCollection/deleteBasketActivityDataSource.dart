import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<void> deleteBasketActivity({
  required String basketActivityId,
}) async {
  try {
    await pb.collection('basketActivity').delete(basketActivityId);
  } catch (e) {
    rethrow;
  }
}
