import 'package:shahabfit/Utils/handleemtyresponse.dart';
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
  print(filterQuery);
  try {
    final records = await pb.collection('basketActivity').getFullList(
        sort: '+numberView,-created',
        filter: filterQuery,
        expand: 'activity,basket,system,activity.catId');

    print(records.toString());
    if (records.isEmpty) {
      handleEmptyResponse();
    }
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
