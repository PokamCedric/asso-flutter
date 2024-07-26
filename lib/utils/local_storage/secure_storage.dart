import 'package:african_windows/configs/application.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UtilSecureStorage {

  static FlutterSecureStorage get secureStorage {
    if (Application.secureStorage == null) {
      throw ("Call Application Setup to initialize secure_storage");
    }
    return Application.secureStorage!;
  }

  static Future<String?> read(String key) {
    return secureStorage.read(key: key);
  }

  static Future<Map<String, String>> readAll() {
    return secureStorage.readAll();
  }

  static Future<void> delete(String key) {
    return secureStorage.delete(key: key);
  }

  static Future<void> deleteAll() {
    return secureStorage.deleteAll();
  }

  static Future<void> write(String key, String value) {
    return secureStorage.write(key: key, value: value);
  }


  ///Singleton factory
  static final UtilSecureStorage _instance = UtilSecureStorage._internal();

  factory UtilSecureStorage() {
    return _instance;
  }

  UtilSecureStorage._internal();
}
