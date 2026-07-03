import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> saveAuthState() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("hasAuthenticated", true);
  }

  static Future<bool> hasAuthenticated() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("hasAuthenticated") ?? false;
  }
}