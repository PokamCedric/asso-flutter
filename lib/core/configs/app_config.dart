import 'package:african_windows/core/models/model_user.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppConfig {
  static const String name = 'Asso';
  static const BreadcrumbItem breadcrumbItemDefault = BreadcrumbItem(name: name, route: Routes.initial);
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
