import 'package:pocketbase/pocketbase.dart';

handleException(dynamic error) {
  if (error is ClientException) {
    return error.response['message'];
  } else {
    return "خطای غیرمنتظره: ${error.toString()}";
  }
}
