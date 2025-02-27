import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

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
  print(filterQuery);
  try {
    final records = await pb.collection('basketActivity').getFullList(
        sort: '+numberView',
        filter: filterQuery,
        expand: 'activity,basket,system');

    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
