import 'package:shahabfit/constants/url.dart';

Future<void> deleteBasketActivity({
  required String basketActivityId,
}) async {
  try {
    await pb.collection('basketActivity').delete(basketActivityId);
  } catch (e) {
    rethrow;
  }
}
