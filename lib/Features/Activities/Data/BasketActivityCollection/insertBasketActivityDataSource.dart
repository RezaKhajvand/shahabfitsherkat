import 'package:shahabfit/constants/pb.dart';

Future<String> insertBasketActivity({
  required String basket,
  required int dayOfWeek,
  required String activity,
  required List<List<int>> activitySet,
}) async {
  var body = {
    "basket": basket,
    "dayOfWeek": dayOfWeek,
    "activity": activity,
    "activitySet": activitySet,
    "numberView": 1000
  };
  try {
    final record = await pb.collection('basketActivity').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
