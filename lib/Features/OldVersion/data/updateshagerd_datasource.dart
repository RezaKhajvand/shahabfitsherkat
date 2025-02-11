import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<String> updateShagerdDatasource(Shagerd shagerd) async {
  try {
    final response = await pb
        .collection('shagerd')
        .update(shagerd.id, body: shagerd.toJson());
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
