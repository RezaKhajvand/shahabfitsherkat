import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<void> createJalaseDatasource(Shagerd shagerd) async {
  try {
    final response =
        await pb.collection('jalase').create(body: {"shagerd": shagerd.id});
    print(response);
  } catch (e) {
    rethrow;
  }
}
