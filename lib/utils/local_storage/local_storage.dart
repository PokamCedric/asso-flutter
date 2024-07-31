import 'package:african_windows/configs/theme/theme.dart';
import 'package:african_windows/utils/local_storage/preferences.dart';


class LocalStorage {
  static const String _loggedInUserKey = 'user';
  static const String _darkOptionKey = 'darkOption';
  static const String _languageKey = 'lang_code';

  static Future<bool> setLoggedInUser(bool loggedIn) async {
    return UtilPreferences.setBool(_loggedInUserKey, loggedIn);
  }

  static Future<bool?> getLoggedInUser() async {
    return UtilPreferences.getBool(_loggedInUserKey);
  }

  static Future<bool> removeLoggedInUser() async {
    return UtilPreferences.remove(_loggedInUserKey);
  }

  static Future<bool> setDarkOption(DarkOption darkOption) async {
    return UtilPreferences.setString(_darkOptionKey, darkOptionToString(darkOption));
  }

  static Future<DarkOption> getDarkOption() async {
    final String? darkOptionString = UtilPreferences.getString(_darkOptionKey);

    if (darkOptionString != null) {
      return darkOptionFromString(darkOptionString);
    } else {
      return DarkOption.dynamic; // Default option if none is set
    }
  }

  static String? getLanguage() {
    return UtilPreferences.getString(_languageKey);
  }

  // static Future<bool> setLanguage(Language language) {
  //   return UtilPreferences.setString(_languageKey, language.locale.languageCode);
  // }
}
