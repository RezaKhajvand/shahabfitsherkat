import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> deleteActivity({
  required String activityId,
}) async {
  var dio = Dio();
  try {
    var response = await dio.request(
      '$baseUrl/collections/activity/records/$activityId',
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
    print(e);
    rethrow;
  }
}
