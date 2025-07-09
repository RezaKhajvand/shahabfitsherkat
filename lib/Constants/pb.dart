import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Utils/authmanager.dart';
// http://127.0.0.1:8090/
// https://bermooda.liara.run

final pb = PocketBase(
  'https://bermooda.liara.run',
  httpClientFactory: () => MyHttpClient(),
);

class MyHttpClient extends http.BaseClient {
  bool firstTime = true;
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // اضافه کردن توکن به هدر
    final token = AuthManager.readAccessToken();
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = AuthManager.readAccessToken()!;
    }
    final response = await _inner.send(request);
    // هندل کردن 401
    if (response.statusCode == 401) {
      try {
        if (!firstTime) {
          throw ClientException(
              response: {"message": "Expired Auth"}, statusCode: 400);
        }
        firstTime = false;
        print('Auth Refreshing');
        final auth = await pb.collection('users').authRefresh(headers: headers);
        pb.authStore.save(auth.token, auth.record);
        await AuthManager.saveAuth(pb.authStore);
      } catch (e, s) {
        handleException(e, s);
        logOut();
      }
    }
    return response;
  }
}
