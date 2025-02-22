import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<void> deleteShagerdAllJalasatDatasource(Shagerd shagerd) async {
  try {
    final records = await pb
        .collection('jalase')
        .getFullList(filter: 'shagerd="${shagerd.id}"');

    await Future(
      () {
        for (var element in records) {
          pb.collection('jalase').delete(element.id);
        }
      },
    );
  } catch (e) {
    ;
    rethrow;
  }
}
