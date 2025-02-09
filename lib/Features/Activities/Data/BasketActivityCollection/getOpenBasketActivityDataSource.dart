import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Utils/Exception.dart';
import 'package:shahabfit/Di.dart';

Future<String> getOpenBasketActivity(
    {String? dayOfWeek, required String basketId}) async {
  var dio = Dio();

  try {
    var response = await dio.request(
      '$baseUrl/collections/basketActivity/records?perPage=1000&expand=activity,basket,system&&sort=+numberView&filter=basket="$basketId"${dayOfWeek != null ? 'dayOfWeek=$dayOfWeek' : ""}',
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
