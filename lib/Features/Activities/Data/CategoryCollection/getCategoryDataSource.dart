import 'package:shahabfit/constants/url.dart';

Future<String> getCategory() async {
  try {
    final records = await pb.collection('category').getFullList();
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
