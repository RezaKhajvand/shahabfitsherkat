import 'package:shahabfit/constants/url.dart';

Future<String> getDaylimealList() async {
  try {
    final records =
        await pb.collection('daylimeal').getFullList(sort: '-updated');
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
