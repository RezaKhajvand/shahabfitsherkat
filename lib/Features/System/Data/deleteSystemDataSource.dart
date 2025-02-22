import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<void> deleteSystem({required String id}) async {
  try {
    await pb.collection('system').delete(id);
  } catch (e) {
    ;
    rethrow;
  }
}
