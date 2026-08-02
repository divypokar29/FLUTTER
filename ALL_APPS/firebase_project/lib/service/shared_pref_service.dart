import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _loginKey = 'is_logged_in';

  static Future<void> setLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, isLogin);
  }

  static Future<bool> getLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }
}
