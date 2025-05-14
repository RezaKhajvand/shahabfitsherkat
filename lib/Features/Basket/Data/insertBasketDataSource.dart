import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<RecordModel> insertBasket({
  required String name,
  required String level,
  required String description,
}) async {
  final body = {
    "name": name,
    "user": AuthManager.readUser(),
    "level": level,
    "description": description,
  };
  try {
    final record = await pb.collection('basket').create(body: body);
    print(record.toJson());
    return record;
  } catch (e) {
    rethrow;
  }
}
