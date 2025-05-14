import 'package:shahabfit/Utils/handleemtyresponse.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> getOpenBasket() async {
  try {
    final records =
        await pb.collection('basket').getFullList();
    print(records.toString());
    if (records.isEmpty) {
      handleEmptyResponse();
    }

    return records.toString();
  } catch (e) {
    rethrow;
  }
}
