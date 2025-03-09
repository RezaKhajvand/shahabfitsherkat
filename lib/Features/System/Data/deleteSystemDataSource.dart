import 'package:shahabfit/constants/url.dart';

Future<void> deleteSystem({required String id}) async {
  try {
    await pb.collection('system').delete(id);
  } catch (e) {
    rethrow;
  }
}
