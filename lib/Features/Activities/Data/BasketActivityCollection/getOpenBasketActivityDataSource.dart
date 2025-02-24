import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> getOpenBasketActivity(
    {String? dayOfWeek, required String basketId}) async {
  try {
    final records = await pb.collection('basketActivity').getFullList(
        sort: '+numberView',
        filter:
            'basket="$basketId"${dayOfWeek != null ? 'dayOfWeek=$dayOfWeek' : ""}',
        expand: 'activity,basket,system');
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
