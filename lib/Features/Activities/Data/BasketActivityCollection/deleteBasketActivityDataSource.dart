import 'package:shahabfit/constants/pb.dart';

Future<void> deleteBasketActivity({
  required String basketActivityId,
}) async {
  try {
    await pb.collection('basketActivity').delete(basketActivityId);
  } catch (e) {
    rethrow;
  }
}
