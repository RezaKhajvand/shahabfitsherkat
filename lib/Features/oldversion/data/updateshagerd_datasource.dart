import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<String> updateShagerdDatasource(Shagerd shagerd) async {
  try {
    var body = shagerd.toJson();
    body.removeWhere((key, value) => key == 'profileimage');
    final response =
        await pb.collection('shagerd').update(shagerd.id ?? '', body: body);
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
