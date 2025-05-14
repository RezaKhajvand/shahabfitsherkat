import 'package:shahabfit/di.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> updateBasket(
    {required String basketId,
    required String name,
    required int dayCount,
    required String level,
    required String description}) async {
  final body = <String, dynamic>{
    "name": name,
    "user": userId,
    "dayCount": dayCount,
    "level": level,
    "description": description,
  };
  try {
    final record = await pb.collection('basket').update(basketId, body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
