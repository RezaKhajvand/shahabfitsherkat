import 'package:shahabfit/constants/url.dart';

Future<void> deleteBasket({required String record}) async {
  try {
    await pb.collection('basket').delete(record);
  } catch (e) {
    rethrow;
  }
}
