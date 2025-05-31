import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  factory SharedPrefs() => SharedPrefs.internal();
  SharedPrefs.internal();

  static late SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const userIdKey = 'userId';

  static Future<void> setIntValue({
    required String key,
    required int value,
  }) async {
    await _sharedPreferences?.setInt(key, value);
  }

  static int? getIntValue({
    required String key,
  }) {
    return _sharedPreferences?.getInt(key);
  }

  static Future<void> clearAll() async {
    await _sharedPreferences?.clear();
  }
}
