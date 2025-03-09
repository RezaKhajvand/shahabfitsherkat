import 'package:shahabfit/di.dart';
import 'package:shahabfit/constants/url.dart';

Future<String> getSystem() async {
  try {
    final records = await pb
        .collection('system')
        .getFullList(filter: '(user="$userId"||user="")');
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
