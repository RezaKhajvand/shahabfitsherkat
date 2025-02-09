import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> deleteBasketActivity({
  required String basketActivityId,
}) async {
  var dio = Dio();

  try {
    var response = await dio.request(
      '$baseUrl/collections/basketActivity/records/$basketActivityId',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
    );

    if (response.statusCode == 204) {
      print(json.encode(response.data));
      return json.encode(response.data);
    } else {
      throw CustomException('مشکلی پیش آمده');
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}
