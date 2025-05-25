import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/constants/pb.dart';

Future<void> createJalaseDatasource(Shagerd shagerd) async {
  final body = <String, dynamic>{
    "shagerd": shagerd.id,
    "datetime": DateTime.now().toUtc().toString(),
    "verifyMode": "other"
  };
  try {
    final response = await pb.collection('jalase').create(body: body);
    print(shagerd.toJson());
  } catch (e) {
    rethrow;
  }
}
