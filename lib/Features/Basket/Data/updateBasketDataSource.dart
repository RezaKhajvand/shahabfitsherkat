import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> updateBasket(
    {required String basketId,
    required String name,
    required String level,
    required String description}) async {
  final body = <String, dynamic>{
    "name": name,
    "user": AuthManager.readUser(),
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
