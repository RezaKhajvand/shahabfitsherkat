import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<void> deleteActivity({
  required String activityId,
}) async {
  try {
    await pb.collection('activity').delete(activityId);
  } catch (e) {
    
    rethrow;
  }
}
