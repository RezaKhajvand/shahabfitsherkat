import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> getBasketList() async {
  var dio = Dio();

  try {
    var response = await dio.request(
      '$baseUrl/collections/basket/records?sort=-updated&perPage=500',
      options: Options(
        method: 'GET',
      ),
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
