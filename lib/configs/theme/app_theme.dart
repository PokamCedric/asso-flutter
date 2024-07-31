import 'package:african_windows/configs/theme/app_text_form_field_theme.dart';
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


  static ColorScheme getColorScheme({
    required ColorSeed colorSeed,
    Brightness brightness = Brightness.light,
    Color? accentColor,
    Color? cardColor,
    Color? backgroundColor,
    Color? errorColor,
  }) {
    final bool isDark = brightness == Brightness.dark;
    final bool primaryIsDark = _brightnessFor(colorSeed.color) == Brightness.dark;
    final Color secondary = accentColor ?? (isDark ? Colors.tealAccent[200]! : colorSeed.color);
    final bool secondaryIsDark = _brightnessFor(secondary) == Brightness.dark;

    return ColorScheme(
      primary: colorSeed.color,
      secondary: secondary,
      surface: cardColor ?? (isDark ? Colors.grey[800]! : Colors.white),
      background: backgroundColor ?? (isDark ? Colors.grey[700]! : colorSeed.color.withOpacity(0.2)),
      error: errorColor ?? Colors.red[700]!,
      onPrimary: primaryIsDark ? Colors.white : Colors.black,
      onSecondary: secondaryIsDark ? Colors.white : Colors.black,
      onSurface: isDark ? Colors.white : Colors.black,
      onBackground: primaryIsDark ? Colors.white : Colors.black,
      onError: isDark ? Colors.black : Colors.white,
      brightness: brightness,
    );
  }

  static Brightness _brightnessFor(Color color) {
    final double brightness = (color.red * 299 + color.green * 587 + color.blue * 114) / 1000;
    return brightness > 128 ? Brightness.light : Brightness.dark;
  }


  static ThemeData myTheme(ColorSeed colorSeed, String font, Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final colorScheme = getColorScheme(colorSeed: colorSeed, brightness: brightness);
    final contrastColor = isLight ? Colors.black : Colors.white;
    final myGrey = isLight ? Colors.grey[300] : Colors.grey[800];
    final myGreyLight = isLight ? Colors.grey[400] : Colors.grey[600];

    return ThemeData(
      colorScheme: colorScheme,
      inputDecorationTheme: isLight ? AppTextFormFieldTheme.lightInputDecorationTheme
                                    : AppTextFormFieldTheme.darkInputDecorationTheme,
      fontFamily: font,
      brightness: brightness,
      primaryColor: colorScheme.primary,
      primaryColorLight: colorScheme.primary.withOpacity(0.7),
      primaryColorDark: colorScheme.primary.withOpacity(0.9),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: myGrey,
      highlightColor: contrastColor.withOpacity(0.1),
      splashColor: contrastColor.withOpacity(0.1),
      unselectedWidgetColor: contrastColor.withOpacity(0.7),
      disabledColor: myGreyLight,
      secondaryHeaderColor: colorScheme.secondary,
      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.onSecondary,
      hintColor: contrastColor.withOpacity(0.5),
    );
  }

}
