import 'package:core_dashboard/models/model_theme.dart'; // Adjust import as per your project structure
import 'package:core_dashboard/configs/app_theme.dart'; // Adjust import as per your project structure
import 'package:flutter/material.dart';

enum DarkOption { dynamic, alwaysOn, alwaysOff }

class AppTheme {

  /// Default font
  static String currentFont = "Roboto";

  /// List Font support
  static List<String> fontSupport = ["Raleway", "Roboto", "Merriweather"];

  /// Default Theme
  static ThemeModel currentTheme = ThemeModel(
    name: "default",
    colorSeed: ColorSeed.indigo, // Example default theme using ColorSeed enum
  );

  /// List Theme Support in Application
  static List<ThemeModel> themeSupport = [
    ThemeModel(
      name: "default",
      colorSeed: ColorSeed.indigo, // Example default theme using ColorSeed enum
    ),
    ThemeModel(
      name: "brown",
      colorSeed: ColorSeed.teal, // Adjust based on your ColorSeed enum values
    ),
    ThemeModel(
      name: "pink",
      colorSeed: ColorSeed.pink, // Adjust based on your ColorSeed enum values
    ),
    ThemeModel(
      name: "orange",
      colorSeed: ColorSeed.orange, // Adjust based on your ColorSeed enum values
    ),
    ThemeModel(
      name: "green",
      colorSeed: ColorSeed.green, // Adjust based on your ColorSeed enum values
    ),
  ];

  /// Dark Theme option
  static DarkOption darkThemeOption = DarkOption.dynamic;

  static ThemeData lightTheme = CollectionTheme.getCollectionTheme(
    colorSeed: currentTheme.colorSeed!,
    font: currentFont,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = CollectionTheme.getCollectionTheme(
    colorSeed: currentTheme.colorSeed!,
    font: currentFont,
    brightness: Brightness.dark,
  );

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
