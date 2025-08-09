import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shahabfit/Features/Daylimeal/models/ai_model.dart';

Future<String> aiRequest(String content) async {
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2NDZmNjZjNmM4MmM2ZTdlZGI1NzgzZjYiLCJ0eXBlIjoiYXV0aCIsImlhdCI6MTc1NDc0MTQwN30.rnXuX_Lrmr5hhh7Y6oG2wqy-eDiiK9F6EWD_BXw_ebg'
  };
  var data = json.encode({
    "model": "openai/gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "من مربی بدنسازی و متخصص تغذیه هستم"},
      {"role": "user", "content": content}
    ]
  });
  print(content);
  var dio = Dio();
  try {
    var response = await dio.request(
      'https://ai.liara.ir/api/v1/68973a83e6dcb068f228e88f/chat/completions',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return AiResponse.fromRawJson(json.encode(response.data))
          .choices
          .first
          .message
          .content;
    } else {
      print(response.statusMessage);
      throw Exception('با مشکل مواجه شدید');
    }
  } catch (e) {
    return e.toString();
  }
}
