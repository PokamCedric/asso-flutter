import 'dart:convert';

import 'package:african_windows/configs/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilPreferences {

  static SharedPreferences get preferences {
    if (Application.preferences == null) {
      throw ("Call Application Setup to initialize shared_preferences");
    }
    return Application.preferences!;
  }

  static Future<bool> clearKey(String key) {
    return preferences.remove(key);
  }

  static bool containsKey(String key) {
    return preferences.containsKey(key);
  }

  static dynamic get(String key) {
    return preferences.get(key);
  }

  static bool? getBool(String key) {
    return preferences.getBool(key);
  }

  static double? getDouble(String key) {
    return preferences.getDouble(key);
  }

  static int? getInt(String key) {
    return preferences.getInt(key);
  }

  static Set<String> getKeys() {
    return preferences.getKeys();
  }

  static String? getString(String key) {
    return preferences.getString(key);
  }

  static List<String>? getStringList(String key) {
    return preferences.getStringList(key);
  }

  static Future<void> reload() {
    return preferences.reload();
  }

  static Future<bool> remove(String key) {
    return preferences.remove(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return preferences.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return preferences.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return preferences.setInt(key, value);
  }

  static Future<bool> setString(String key, String value) {
    return preferences.setString(key, value);
  }

  static Future<bool> setObject(String key, value) {
    return preferences.setString(
      key,
      jsonEncode(value.toJson()),
    );
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return preferences.setStringList(key, value);
  }

  static Future<bool> setObjetList(String key, List value) {
    List<String> listString = [];
    value.forEach((element) {
      listString.add(jsonEncode(element.toJson()));
    });

    return setStringList(key, listString);
  }

  ///Singleton factory
  static final UtilPreferences _instance = UtilPreferences._internal();

  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();
}
