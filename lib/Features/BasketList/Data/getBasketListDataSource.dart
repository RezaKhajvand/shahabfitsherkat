import 'package:shahabfit/constants/pb.dart';

Future<String> getBasketList() async {
  try {
    final records = await pb.collection('basket').getFullList(sort: '-updated');
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
