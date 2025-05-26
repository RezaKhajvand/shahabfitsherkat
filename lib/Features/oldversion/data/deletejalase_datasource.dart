import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> deleteLastJalaseDatasource(Shagerd shagerd) async {
  try {
    final record = await pb.collection('jalase').getFirstListItem(
          'shagerd="${shagerd.id}"',
        );
    await pb.collection('jalase').delete(record.id);
  } catch (e) {
    rethrow;
  }
}
