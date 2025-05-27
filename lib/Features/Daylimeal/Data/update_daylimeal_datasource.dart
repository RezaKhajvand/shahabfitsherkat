import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

Future<String> updateDaylimeal(
    {required Trainer trainer, required String id}) async {
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
  }..removeWhere(
      (key, value) => value == null,
    );
  print(body);
  final record = await pb.collection('daylimeal').update(id, body: body);
  try {
    print(record.toString());
    return record.toString();
  } catch (e) {
    rethrow;
  }
}
