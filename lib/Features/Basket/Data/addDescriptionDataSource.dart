import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> addDescription(String text, DescriptionType type) async {
  var body = {
    "text": text,
    "type": getDescriptionTitle(type),
    "user": AuthManager.readUser(),
  };
  try {
    final record = await pb.collection('description').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
