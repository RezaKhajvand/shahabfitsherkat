import 'package:shahabfit/constants/pb.dart';

Future<String> getSystem() async {
  try {
    final records = await pb.collection('system').getFullList();
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
