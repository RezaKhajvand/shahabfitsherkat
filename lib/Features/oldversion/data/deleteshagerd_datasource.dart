import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> deleteShagerdDatasource(Shagerd shagerd) async {
  try {
    await pb.collection('shagerd').delete(shagerd.id ?? '');
  } catch (e) {
    rethrow;
  }
}
