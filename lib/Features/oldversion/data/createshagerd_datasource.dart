import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<String> createShagerdDatasource(Shagerd shagerd) async {
  try {
    final response = await pb
        .collection('shagerd')
        .create( body: shagerd.toJson());
    print(response);
    return response.toString();
  } catch (e) {
    rethrow;
  }
}
