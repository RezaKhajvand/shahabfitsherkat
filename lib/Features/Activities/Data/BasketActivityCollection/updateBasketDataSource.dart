import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> closeBasket(
    {required String basketId,
    required String name,
    required int dayCount,
    required String level}) async {
  var dio = Dio();
  final data = <String, dynamic>{
    "name": name,
    "isOpen": false,
    "user": userId,
    "dayCount": dayCount,
    "level": level
  };
  try {
    var response =
        await dio.request('$baseUrl/collections/basket/records/$basketId',
            options: Options(
              method: 'PATCH',
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
