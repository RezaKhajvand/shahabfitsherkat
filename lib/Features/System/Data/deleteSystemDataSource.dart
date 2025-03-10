import 'package:shahabfit/constants/pb.dart';

Future<void> deleteSystem({required String id}) async {
  try {
    await pb.collection('system').delete(id);
  } catch (e) {
    rethrow;
  }
}
