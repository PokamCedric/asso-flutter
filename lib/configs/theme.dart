import 'package:core_dashboard/models/model_theme.dart'; // Adjust import as per your project structure
import 'package:core_dashboard/configs/app_theme.dart'; // Adjust import as per your project structure
import 'package:flutter/material.dart';

enum DarkOption { dynamic, alwaysOn, alwaysOff }

  // Convert DarkOption to a string
  String darkOptionToString(DarkOption option) {
    switch (option) {
      case DarkOption.alwaysOn:
        return 'alwaysOn';
      case DarkOption.alwaysOff:
        return 'alwaysOff';
      case DarkOption.dynamic:
      default:
        return 'dynamic';
    }
  }

  // Convert a string to DarkOption
  DarkOption darkOptionFromString(String option) {
    switch (option) {
      case 'alwaysOn':
        return DarkOption.alwaysOn;
      case 'alwaysOff':
        return DarkOption.alwaysOff;
      case 'dynamic':
      default:
        return DarkOption.dynamic;
    }
  }

class AppTheme {

  /// Default font
  static String currentFont = "Roboto";

  /// List Font support
  static List<String> fontSupport = ["Raleway", "Roboto", "Merriweather"];

  /// Default Theme
  static ThemeModel currentTheme = ThemeModel(
    name: "default",
    colorSeed: ColorSeed.pink, // Example default theme using ColorSeed enum
  );

  /// List Theme Support in Application
  static List<ThemeModel> themeSupport = [
    ThemeModel(
      name: "default",
      colorSeed: ColorSeed.indigo, // Example default theme using ColorSeed enum
    ),
    ThemeModel(
      name: "brown",
      colorSeed: ColorSeed.teal,
    ),
    ThemeModel(
      name: "pink",
      colorSeed: ColorSeed.pink,
    ),
    ThemeModel(
      name: "orange",
      colorSeed: ColorSeed.orange,
    ),
    ThemeModel(
      name: "green",
      colorSeed: ColorSeed.green,
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
