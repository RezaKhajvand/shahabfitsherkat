import 'package:pocketbase/pocketbase.dart';

var pb = PocketBase('https://club.liara.run');
Future<String> getShagerdList() async {
  try {
    var response = await pb.collection('shagerd').getFullList(sort: '-created');
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
