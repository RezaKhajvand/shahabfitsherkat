import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> getDaylimealList() async {
  var dio = Dio();

  try {
    var response = await dio.request(
      '$baseUrl/collections/daylimeal/records?sort=-updated&perPage=500',
      options: Options(method: 'GET', headers: headers),
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
