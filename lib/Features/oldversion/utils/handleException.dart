import 'package:pocketbase/pocketbase.dart';

handleException(dynamic e, StackTrace s) {
  if (e is ClientException) {
    final message =
        e.response['data']?['name']?['message'] ?? e.response['message'];
    print('\x1B[31mError: $message\x1B[0m');
    print('\x1B[33m${s.toString().split('\n').join('\n\x1B[33m')}\x1B[0m');
    return message;
  } else {
    print(e);
    print(s);
    return "خطای غیرمنتظره لطفا دوباره تلاش کنید";
  }
}
