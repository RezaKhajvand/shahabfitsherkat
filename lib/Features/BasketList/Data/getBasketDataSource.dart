import 'package:shahabfit/constants/pb.dart';

Future<String> getBasket(String basketId) async {
  try {
    final record = await pb.collection('basket').getOne(basketId);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
