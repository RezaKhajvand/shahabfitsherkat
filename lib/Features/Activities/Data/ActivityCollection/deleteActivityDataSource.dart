
import 'package:shahabfit/constants/pb.dart';

Future<void> deleteActivity({
  required String activityId,
}) async {
  try {
    await pb.collection('activity').delete(activityId);
  } catch (e) {
    
    rethrow;
  }
}
