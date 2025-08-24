import 'package:shahabfit/constants/pb.dart';

Future<void> deleteDaylimeal({required String id}) async {
  try {
    await pb.collection('daylimeal').delete(id);
  } catch (e) {
    rethrow;
  }
}
