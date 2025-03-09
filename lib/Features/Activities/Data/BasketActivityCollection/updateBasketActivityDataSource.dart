import 'package:shahabfit/constants/url.dart';

Future<String> updateBasketActivity({
  required String basketActivityId,
  String? system,
  int? systemSubId,
  List<List<int>>? activitySet,
  int? numberView,
}) async {
  var body = {
    "system": system,
    "systemSubId": systemSubId,
    "activitySet": activitySet,
    "numberView": numberView
  }..removeWhere((key, value) => value == null);
  try {
    final record = await pb
        .collection('basketActivity')
        .update(basketActivityId, body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
