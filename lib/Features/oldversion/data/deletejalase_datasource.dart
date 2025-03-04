import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

Future<void> deleteLastJalaseDatasource(Shagerd shagerd) async {
  try {
    final record = await pb
        .collection('jalase')
        .getList(sort: '-created', perPage: 1, page: 1);
    if (record.items.isNotEmpty) {
      await pb.collection('jalase').delete(record.items.first.id);
    } else {
      print('جلسه ندارد');
    }
  } catch (e) {
    rethrow;
  }
}
