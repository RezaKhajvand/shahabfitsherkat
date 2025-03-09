import 'package:shahabfit/di.dart';
import 'package:shahabfit/constants/url.dart';

Future<String> updateBasket(
    {required String basketId,
    required String name,
    required bool isOpen,
    required int dayCount,
    required String level}) async {
  final body = <String, dynamic>{
    "name": name,
    "isOpen": isOpen,
    "user": userId,
    "dayCount": dayCount,
    "level": level
  };
  try {
    final record = await pb.collection('basket').update(basketId, body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
