import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<void> deleteShagerdDatasource(Shagerd shagerd) async {
  try {
    await pb.collection('shagerd').delete(shagerd.id??'');
  } catch (e) {
    rethrow;
  }
}
