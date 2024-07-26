import 'package:african_windows/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Application {
  static bool debug = true;
  static String version = '1.0.0';
  static SharedPreferences? preferences;
  static FlutterSecureStorage? secureStorage;
  static UserModel? user;

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
