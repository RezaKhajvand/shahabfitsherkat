import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://club.liara.run/api';
const String userId = 'woua395dee0l9em';
var headers = {'Content-Type': 'application/json'};
GetIt locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
