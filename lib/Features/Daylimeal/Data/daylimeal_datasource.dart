import 'package:shahabfit/constants/pb.dart';

Future<String> getDaylimeal(String barnameId) async {
  try {
    final record = await pb.collection('daylimeal').getOne(barnameId);
    print(record);
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
