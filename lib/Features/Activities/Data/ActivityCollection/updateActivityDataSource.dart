import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> updateActivity({
  required String activityId,
  String? title,
  String? catId,
  bool? isInBasket,
  int? numberView,
}) async {
  var body = {
    "title": title,
    "catId": catId,
    "isInBasket": isInBasket,
  "user": AuthManager.readUser(),
    "numberView": numberView,
  }..removeWhere((key, value) => value == null);
  try {
    final record =
        await pb.collection('activity').update(activityId, body: body);

    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
