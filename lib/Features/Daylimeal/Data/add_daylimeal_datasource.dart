import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> addDaylimeal({required Trainer trainer}) async {
  var body = {
    "user": AuthManager.readUser(),
    "name": trainer.name,
    "calories": trainer.calories,
    "gender": trainer.gender,
    "height": trainer.height,
    "weight": trainer.weight,
    "wrist": trainer.wrist,
    "age": trainer.age,
    "protein": trainer.protein,
    "carbo": trainer.carbo,
    "fat": trainer.fat,
    "activity": trainer.activity,
    "daylimeal": trainer.daylimeal,
  };
  try {
    final record = await pb.collection('daylimeal').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
