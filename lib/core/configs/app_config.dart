import 'package:african_windows/core/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppConfig {
  static bool debug = true;
  static String version = '1.0.0';
  static SharedPreferences? preferences;
  static FlutterSecureStorage? secureStorage;
  static UserModel? user;

  ///Singleton factory
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();
}
