import 'package:shahabfit/constants/pb.dart';

Future<String> getOpenBasketActivity(
    {String? dayOfWeek, String? basketId, String? recordId}) async {
  List<String> filters = [];
  if (basketId != null) {
    filters.add('basket="$basketId"');
  }
  if (dayOfWeek != null) {
    filters.add('dayOfWeek="$dayOfWeek"');
  }
  if (recordId != null) {
    filters.add('id="$recordId"');
  }
  String filterQuery = filters.join(' && ');
  print("Filter======>$filterQuery");
  print("Header======>${{"id": recordId}}");
  try {
    final records = await pb.collection('basketActivity').getFullList(
        sort: '+numberView',
        filter: filterQuery,
        expand: 'activity,basket,system,activity.catId',
        headers: basketId == null ? {} : {"id": basketId});

    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
