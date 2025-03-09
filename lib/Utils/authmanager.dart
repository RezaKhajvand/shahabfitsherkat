import 'package:shahabfit/Di.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences _prefs = locator.get();

  //Save access token
  static saveAccessToken(String accessToken) async {
    await _prefs.setString('accessToken', accessToken);
    print('save shod : $accessToken');
  }

  //Read access token
  static String? readAccessToken() {
    return _prefs.getString('accessToken');
  }

  static Future clearAuthData() async {
    await _prefs.clear();
  }
}

logOut() async {
  await AuthManager.clearAuthData();
  while (router.canPop()) {
    router.pop();
  }
  router.pushReplacement(loginPage);
}
