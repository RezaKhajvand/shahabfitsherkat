import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> fetchChatGPTResponse(String prompt) async {
  final apiKey = dotenv.env['OPENAI_API_KEY'];
  final dio = Dio();
  final response = await dio.post(
    'https://api.openai.com/v1/chat/completions',
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    ),
    data: jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': prompt},
      ],
    }),
  );

  if (response.statusCode == 200) {
    final data = response.data;
    final reply = data['choices'][0]['message']['content'];
    return reply;
  } else {
    throw Exception('Failed to fetch response from ChatGPT');
  }
}
