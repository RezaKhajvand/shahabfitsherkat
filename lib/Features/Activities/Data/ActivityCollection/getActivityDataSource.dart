import 'package:shahabfit/constants/pb.dart';

Future<String> getActivity({required String catId}) async {
  try {
    var response =
        await pb.collection('activity').getFullList(filter: 'catId="$catId"');
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
