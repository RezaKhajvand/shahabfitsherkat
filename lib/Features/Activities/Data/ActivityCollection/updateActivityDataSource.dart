import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> updateActivity({
  required String activityId,
  String? title,
  String? catId,
  bool? isInBasket,
  int? numberView,
}) async {
  var dio = Dio();
  var data = json.encode({
    "title": title,
    "catId": catId,
    "isInBasket": isInBasket,
    "user": userId,
    "numberView": numberView,
  }..removeWhere((key, value) => value == null));
  try {
    var response = await dio.request(
      '$baseUrl/collections/activity/records/$activityId',
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
