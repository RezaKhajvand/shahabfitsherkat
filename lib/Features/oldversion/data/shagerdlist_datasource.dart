import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/handleemtyresponse.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> getShagerdList({
  bool? khosusi = false,
  bool? monqzi = false,
  required String searchText,
}) async {
  String now =
      DateTime.now().toUtc().subtract(Duration(days: 30)).toIso8601String();
  List<String> filters = [];
  if (searchText.isNotEmpty) {
    filters.add('name ~ "$searchText"');
  }
  if (khosusi == true) {
    filters.add('khosusi = true');
  }
  if (monqzi == true) {
    filters.add('registerdate < "$now"');
  }
  String filterQuery = filters.join(' && ');
  try {
    var response = await pb.collection('shagerd').getFullList(
          sort: '-registerdate',
          filter: filterQuery,
          headers: AuthManager.header,
        );
    if (response.isEmpty) {
      handleEmptyResponse();
    }
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
