import 'package:shared_preferences/shared_preferences.dart';

class Cache
{
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setMode({
    required String key,
    required bool value,
}) async
  {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getMode({
    required String key,
  })
  {
    return sharedPreferences.getBool(key);
  }
}