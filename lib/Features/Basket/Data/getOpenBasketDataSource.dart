import 'package:shahabfit/constants/pb.dart';

Future<String> getOpenBasket() async {
  try {
    final records = await pb.collection('basket').getFullList();
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
