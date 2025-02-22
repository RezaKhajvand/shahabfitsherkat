import 'package:pocketbase/pocketbase.dart';

var pb = PocketBase('https://club.liara.run');

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
  String filterQuery = filters.join(' && '); // ترکیب شرایط

  print("Filter Query: $filterQuery");
  try {
    var response = await pb.collection('shagerd').getFullList(
          sort: '-registerdate',
          filter: filterQuery,
        );
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
