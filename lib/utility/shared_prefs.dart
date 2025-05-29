import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //factory SharedPrefs() => SharedPrefs.internal();

  // SharedPrefs.internal();

  // static late SharedPreferences? _sharedPreferences;

  // Future<void> init() async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  // }

  static const userIdKey = 'userId';

  static Future<void> setIntValue({
    required String key,
    required int value,
  }) async {
    final sharedPrefInstance = await SharedPreferences.getInstance();
    sharedPrefInstance.setInt(key, value);
  }

  static Future<int?> getIntValue({
    required String key,
  }) async {
    final sharedPrefInstance = await SharedPreferences.getInstance();
    return sharedPrefInstance.getInt(key);
  }
}
