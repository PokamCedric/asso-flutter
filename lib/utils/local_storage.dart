import 'package:core_dashboard/configs/theme.dart';
import 'package:core_dashboard/utils/preferences.dart';


class LocalStorage {
  static String _loggedInUserKey = 'user';
  static String _darkOptionKey = 'darkOption';
  static String _languageKey = 'lang_code';

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
    print("darkoption set");
    print(darkOptionToString(darkOption));
    return UtilPreferences.setString(_darkOptionKey, darkOptionToString(darkOption));
  }

  static Future<DarkOption> getDarkOption() async {
    final String? darkOptionString = UtilPreferences.getString(_darkOptionKey);

    print("darkoption get");
    print(darkOptionString);

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
