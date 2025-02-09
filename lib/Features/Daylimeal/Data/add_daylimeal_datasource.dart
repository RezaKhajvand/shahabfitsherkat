import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> addDaylimeal({required Trainer trainer}) async {
  var dio = Dio();

  var data = json.encode({
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
  });

  try {
    var response = await dio.request(
      '$baseUrl/collections/daylimeal/records',
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return json.encode(response.data);
    } else {
      throw CustomException('مشکلی پیش آمده');
    }
  } catch (e) {
    rethrow;
  }
}
