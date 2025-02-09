import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Utils/Exception.dart';

Future<String> updateBasketActivity({
  required String basketActivityId,
  String? system,
  int? systemSubId,
  List<List<int>>? activitySet,
  int? numberView,
}) async {
  var dio = Dio();
  var data = json.encode({
    "system": system,
    "systemSubId": systemSubId,
    "activitySet": activitySet,
    "numberView": numberView
  }..removeWhere((key, value) => value == null));
  try {
    var response = await dio.request(
      '$baseUrl/collections/basketActivity/records/$basketActivityId',
      options: Options(
        method: 'PATCH',
        headers: headers,
      ),
      data: data,
    );
    print(data);
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
