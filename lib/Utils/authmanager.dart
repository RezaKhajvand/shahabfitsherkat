import 'package:pocketbase/pocketbase.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static int expireTimeInSec = 3600;
  static final SharedPreferences _prefs = locator.get();

  static Map<String, String> readHeader() {
    return {'Authorization': 'Bearer ${readAccessToken()}'};
  }

  static saveAuth(AuthStore auth) async {
    var now = DateTime.now();
    await saveAccessToken(auth.token);
    await saveUser(auth.record?.id ?? '');
    await saveLoginTime(now);
    await saveAccess(auth.record?.get("access") ?? []);
  }

  static saveAccess(List<String> access) async {
    await _prefs.setStringList('access', access);
    print('save shod : $access');
  }

  static List<String> readAccess() {
    return _prefs.getStringList('access')??[];
  }

  static saveFinger(String id) async {
    await _prefs.setString('finger', id);
    print('save shod : $id');
  }

  static String? readFinger() {
    return _prefs.getString('finger');
  }

  //Save user
  static saveUser(String user) async {
    await _prefs.setString('user', user);
    print('save shod : $user');
  }

  //Read user
  static String? readUser() {
    return _prefs.getString('user');
  }

  //Save access token
  static saveAccessToken(String accessToken) async {
    await _prefs.setString('accessToken', accessToken);
    print('save shod : $accessToken');
  }

  //Read access token
  static String? readAccessToken() {
    return _prefs.getString('accessToken');
  }

  //Clear auth
  static Future clearAuthData() async {
    final readFinger = AuthManager.readFinger();
    await _prefs.clear();
    if (readFinger != null) {
      await AuthManager.saveFinger(readFinger);
    }
  }

  //Login Time
  static saveLoginTime(DateTime loginTime) async {
    await _prefs.setString('loginTime', loginTime.toString());
    print('save shod : $loginTime');
  }

  static DateTime? readLoginTime() {
    var loginTime = _prefs.getString('loginTime');
    return loginTime == null ? null : DateTime.parse(loginTime);
  }

  static bool isValid() {
    var now = DateTime.now();
    var tokenCreated = readLoginTime();
    if (tokenCreated != null) {
      if (now.difference(tokenCreated).inSeconds > expireTimeInSec) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}

logOut() async {
  await AuthManager.clearAuthData();
  while (router.canPop()) {
    router.pop();
  }
  router.pushReplacement(loginPage);
}
