import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

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
    "user": userId,
  };
  try {
    final record = await pb.collection('basketActivity').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    ;
    rethrow;
  }
}
