import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> updateSystem(
    {required String title,
    required String description,
    required String id}) async {
  var dio = Dio();
  var data = json.encode({
    "title": title,
    "description": description,
    "user": userId,
  });
  try {
    var response = await dio.request(
      '$baseUrl/collections/system/records/$id',
      options: Options(
        method: 'PATCH',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
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
