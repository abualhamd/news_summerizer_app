import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences _prefs;
  static Future init() async{
     _prefs = await SharedPreferences.getInstance();
  }

  static void setDarkMode({required bool isDark}) async{
    await _prefs.setBool('isDark', isDark);
  }

  static bool? get getDarkMode {
    return _prefs.getBool('isDark');
  }

}