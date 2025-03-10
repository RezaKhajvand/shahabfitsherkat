import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> createJalaseDatasource(Shagerd shagerd) async {
  try {
    final response =
        await pb.collection('jalase').create(body: {"shagerd": shagerd.id});
    print(response);
  } catch (e) {
    rethrow;
  }
}
