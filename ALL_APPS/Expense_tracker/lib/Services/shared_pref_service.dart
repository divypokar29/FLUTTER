import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String loginkey = "isLogin";

  static Future<void> setLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginkey, value);
  }

  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginkey) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(loginkey);
  }
}
