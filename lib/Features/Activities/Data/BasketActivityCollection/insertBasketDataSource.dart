import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> insertBasket() async {
  var dio = Dio();
  final data = <String, dynamic>{
    "name": 'name',
    "isOpen": true,
    "user": userId,
  };
  try {
    var response = await dio.request('$baseUrl/collections/basket/records',
        options: Options(
          method: 'POST',
        ),
        data: data);

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
