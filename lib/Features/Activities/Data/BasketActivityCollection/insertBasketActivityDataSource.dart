import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> insertBasketActivity({
  required String basket,
  required int dayOfWeek,
  required String activity,
  required List<List<int>> activitySet,
}) async {
  var dio = Dio();
  var data = json.encode({
    "basket": basket,
    "dayOfWeek": dayOfWeek,
    "activity": activity,
    "activitySet": activitySet,
    "user": userId,
  });
  try {
    var response = await dio.request(
      '$baseUrl/collections/basketActivity/records',
      options: Options(
        method: 'POST',
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
