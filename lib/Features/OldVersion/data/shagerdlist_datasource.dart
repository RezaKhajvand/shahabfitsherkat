import 'package:pocketbase/pocketbase.dart';

var pb = PocketBase('https://club.liara.run');
Future<List<RecordModel>> getShagerdList() async {
  try {
    return await pb.collection('shagerd').getFullList(sort: '-created');
  } catch (e) {
    rethrow;
  }
}
