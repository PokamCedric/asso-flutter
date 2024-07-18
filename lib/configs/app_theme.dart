import 'package:core_dashboard/configs/app_text_form_field_theme.dart';
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
    required String theme,
    required ColorSeed colorSeed,
    String font = "Raleway",
  }) {
    switch (theme) {
      case "primaryLight":
        return primaryLight(colorSeed, font);
      case "primaryDark":
        return primaryDark(colorSeed, font);
      default:
        return primaryLight(colorSeed, font);
    }
  }

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

  static ThemeData primaryDark(ColorSeed colorSeed, String font) {
    final colorScheme = getColorScheme(colorSeed: colorSeed, brightness: Brightness.dark);

    return ThemeData(
      colorScheme: colorScheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      fontFamily: font,
      brightness: Brightness.dark,
      primaryColor: colorScheme.primary,
      primaryColorLight: colorScheme.primary.withOpacity(0.7),
      primaryColorDark: colorScheme.primary.withOpacity(0.9),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: Colors.grey[800],
      highlightColor: Colors.white.withOpacity(0.1),
      splashColor: Colors.white.withOpacity(0.1),
      unselectedWidgetColor: Colors.white.withOpacity(0.7),
      disabledColor: Colors.grey[600],
      secondaryHeaderColor: colorScheme.secondary,
      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.onSecondary,
      hintColor: Colors.white.withOpacity(0.5),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        minWidth: 88,
        height: 48,
        padding: EdgeInsets.only(left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        buttonColor: colorScheme.primary,
        disabledColor: Colors.grey[600],
        highlightColor: colorScheme.primary.withOpacity(0.1),
        splashColor: colorScheme.primary.withOpacity(0.1),
        focusColor: colorScheme.primary.withOpacity(0.2),
        hoverColor: colorScheme.primary.withOpacity(0.2),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.primary.withOpacity(0.2),
        brightness: Brightness.dark,
        deleteIconColor: colorScheme.onPrimary,
        disabledColor: Colors.grey[800],
        labelPadding: EdgeInsets.only(left: 8, right: 8),
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        padding: EdgeInsets.all(4),
        secondaryLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: colorScheme.onSecondary,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        secondarySelectedColor: colorScheme.secondary,
        selectedColor: colorScheme.primary,
        shape: StadiumBorder(
          side: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      sliderTheme: SliderThemeData.fromPrimaryColors(
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primary.withOpacity(0.7),
        primaryColorDark: colorScheme.primary.withOpacity(0.9),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData primaryLight(ColorSeed colorSeed, String font) {
    final colorScheme = getColorScheme(colorSeed: colorSeed, brightness: Brightness.light);

    return ThemeData(
      colorScheme: colorScheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      fontFamily: font,
      brightness: Brightness.light,
      primaryColor: colorScheme.primary,
      primaryColorLight: colorScheme.primary.withOpacity(0.7),
      primaryColorDark: colorScheme.primary.withOpacity(0.9),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: Colors.grey[300],
      highlightColor: Colors.black.withOpacity(0.1),
      splashColor: Colors.black.withOpacity(0.1),
      unselectedWidgetColor: Colors.black.withOpacity(0.7),
      disabledColor: Colors.grey[400],
      secondaryHeaderColor: colorScheme.secondary,
      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.onSecondary,
      hintColor: Colors.black.withOpacity(0.5),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        minWidth: 88,
        height: 48,
        padding: EdgeInsets.only(left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        buttonColor: colorScheme.primary,
        disabledColor: Colors.grey[400],
        highlightColor: colorScheme.primary.withOpacity(0.1),
        splashColor: colorScheme.primary.withOpacity(0.1),
        focusColor: colorScheme.primary.withOpacity(0.2),
        hoverColor: colorScheme.primary.withOpacity(0.2),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.primary.withOpacity(0.2),
        brightness: Brightness.light,
        deleteIconColor: colorScheme.onPrimary,
        disabledColor: Colors.grey[300],
        labelPadding: EdgeInsets.only(left: 8, right: 8),
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        padding: EdgeInsets.all(4),
        secondaryLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: colorScheme.onSecondary,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        secondarySelectedColor: colorScheme.secondary,
        selectedColor: colorScheme.primary,
        shape: StadiumBorder(
          side: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
