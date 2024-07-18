import 'package:core_dashboard/models/model_theme.dart';
import 'package:core_dashboard/configs/app_theme.dart';
import 'package:flutter/material.dart';

enum DarkOption { dynamic, alwaysOn, alwaysOff }

class AppTheme {

  ///Default font
  static String currentFont = "Raleway";

  ///List Font support
  static List<String> fontSupport = ["Raleway", "Roboto", "Merriweather"];

  ///Default Theme
  static ThemeModel currentTheme = ThemeModel.fromJson({
    "name": "default",
    "color": const Color(0xffe5634d),
    "light": "primaryLight",
    "dark": "primaryDark",
  });

  ///List Theme Support in Application
  static List themeSupport = [
    {
      "name": "default",
      "color": const Color(0xffe5634d),
      "light": "primaryLight",
      "dark": "primaryDark",
    },
    {
      "name": "brown",
      "color": const Color(0xffa0877e),
      "light": "brownLight",
      "dark": "brownDark",
    },
    {
      "name": "pink",
      "color": const Color(0xffe0a6c1),
      "light": "pinkLight",
      "dark": "pinkDark",
    },
    {
      "name": "orange",
      "color": const Color(0xfff6bb41),
      "light": "pastelOrangeLight",
      "dark": "pastelOrangeDark",
    },
    {
      "name": "green",
      "color": const Color(0xff93b7b0),
      "light": "greenLight",
      "dark": "greenDark",
    },
  ].map((item) => ThemeModel.fromJson(item)).toList();

  ///Dark Theme option
  static DarkOption darkThemeOption = DarkOption.dynamic;

  static ThemeData lightTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.lightTheme,
  );

  static ThemeData darkTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.darkTheme,
  );

  ///Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
