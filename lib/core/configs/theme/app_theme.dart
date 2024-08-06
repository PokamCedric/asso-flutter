import 'package:african_windows/core/configs/theme/app_text_form_field_theme.dart';
import 'package:flutter/material.dart';

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink),
  brightBlue('Bright Blue', Color(0xFF0000FF)),
  brightGreen('Bright Green', Color(0xFF00FF00)),
  brightRed('Bright Red', Color(0xFFFF0000));

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

class CollectionTheme {
  static ThemeData getCollectionTheme({
    required Brightness brightness,
    required ColorSeed colorSeed,
    String font = "Raleway",
  }) => myTheme(colorSeed, font, brightness);


  static ThemeData myTheme(ColorSeed colorSeed, String font, Brightness brightness) {
    final isLight = brightness == Brightness.light;

    return ThemeData(
      colorSchemeSeed: colorSeed.color,
      useMaterial3: true,
      inputDecorationTheme: isLight ? AppTextFormFieldTheme.lightInputDecorationTheme
                                    : AppTextFormFieldTheme.darkInputDecorationTheme,
      fontFamily: font,
      brightness: brightness,

    );
  }

}
