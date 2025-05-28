import 'package:shahabfit/constants/pb.dart';

Future<void> copyAllBasket(String basketId) async {
  try {
    await pb.send('/api/collections/basket/copy/$basketId', method: "POST");
  } catch (e) {
    rethrow;
  }
}
