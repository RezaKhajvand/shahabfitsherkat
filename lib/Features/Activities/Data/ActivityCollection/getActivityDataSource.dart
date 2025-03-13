import 'package:shahabfit/Utils/handleemtyresponse.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> getActivity({required String catId}) async {
  try {
    var response =
        await pb.collection('activity').getFullList(filter: 'catId="$catId"');

    if (response.isEmpty) {
      handleEmptyResponse();
    }
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
