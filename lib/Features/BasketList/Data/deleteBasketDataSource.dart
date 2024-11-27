import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> deleteBasket({required String record}) async {
  var dio = Dio();

  try {
    var response = await dio.request(
      '$baseUrl/collections/basket/records/$record',
      options: Options(
        method: 'DELETE',
      ),
    );

    if (response.statusCode == 204) {
      print(json.encode(response.data));
      return json.encode(response.data);
    } else {
      throw CustomException('مشکلی پیش آمده');
    }
  } catch (e) {
    rethrow;
  }
}
