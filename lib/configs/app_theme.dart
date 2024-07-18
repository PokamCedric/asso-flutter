import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_form_field_theme.dart';

class CollectionTheme {
  static ThemeData getCollectionTheme(
      {String? theme = "primaryLight", String font = "Raleway"}) {
    switch (theme) {
      case "primaryLight":
        return primaryLight(font);

      case "primaryDark":
        return primaryDark(font);

      default:
        return primaryLight(font);
    }
  }

  static ThemeData primaryDark(String font) {
    return ThemeData(
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      fontFamily: font,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      primaryColorLight: AppColors.primaryDarkLight,
      primaryColorDark: AppColors.primaryDarkDark,
      canvasColor: AppColors.bgSecondaryDark,
      scaffoldBackgroundColor: AppColors.bgDark,
      cardColor: AppColors.cardLight,
      dividerColor: AppColors.dividerLight,
      highlightColor: AppColors.highlightDark,
      splashColor: AppColors.splashButtonLight,
      unselectedWidgetColor: AppColors.unselectedWidgetLight,
      disabledColor: AppColors.disabledLight,
      secondaryHeaderColor: AppColors.secondaryHeaderLight,
      dialogBackgroundColor: AppColors.dialogLight,
      indicatorColor: AppColors.indicatorLight,
      hintColor: AppColors.hintLight,
      appBarTheme: const AppBarTheme(
        color: AppColors.bgDark,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        minWidth: 88,
        height: 48,
        padding: EdgeInsets.only(left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.chipShapeLight,
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        buttonColor: AppColors.buttonLight,
        disabledColor: AppColors.disabledButtonLight,
        highlightColor: AppColors.highlightButtonLight,
        splashColor: AppColors.splashButtonLight,
        focusColor: AppColors.focusButtonLight,
        hoverColor: AppColors.hoverButtonLight,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipBackgroundLight,
        brightness: Brightness.dark,
        deleteIconColor: AppColors.chipDeleteLight,
        disabledColor: AppColors.chipDisabledLight,
        labelPadding: const EdgeInsets.only(left: 8, right: 8),
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: AppColors.chipLabelLight,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        padding: const EdgeInsets.all(4),
        secondaryLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: AppColors.chipSecondaryLabelLight,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        secondarySelectedColor: AppColors.chipSecondarySelectedLight,
        selectedColor: AppColors.chipSelectedLight,
        shape: const StadiumBorder(
          side: BorderSide(
            color: AppColors.chipShapeLight,
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      sliderTheme: SliderThemeData.fromPrimaryColors(
        primaryColor: AppColors.primaryDark,
        primaryColorLight: AppColors.primaryDarkLight,
        primaryColorDark: AppColors.primaryDarkDark,
        valueIndicatorTextStyle: const TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      dialogTheme: const DialogTheme(
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

  static ThemeData primaryLight(String font) {
    return ThemeData(
      errorColor: AppColors.error,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      fontFamily: font,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      primaryColorLight: AppColors.primaryLightLight,
      primaryColorDark: AppColors.primaryLightDark,
      canvasColor: AppColors.canvasLight,
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      cardColor: AppColors.cardLight,
      dividerColor: AppColors.dividerLight,
      highlightColor: AppColors.highlightLight,
      splashColor: AppColors.splashLight,
      unselectedWidgetColor: AppColors.unselectedWidgetLight,
      disabledColor: AppColors.disabledLight,
      secondaryHeaderColor: AppColors.secondaryHeaderLight,
      dialogBackgroundColor: AppColors.dialogLight,
      indicatorColor: AppColors.indicatorLight,
      hintColor: AppColors.hintLight,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        minWidth: 88,
        height: 48,
        padding: EdgeInsets.only(left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.chipShapeLight,
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        buttonColor: AppColors.buttonLight,
        disabledColor: AppColors.disabledButtonLight,
        highlightColor: AppColors.highlightButtonLight,
        splashColor: AppColors.splashButtonLight,
        focusColor: AppColors.focusButtonLight,
        hoverColor: AppColors.hoverButtonLight,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipBackgroundLight,
        brightness: Brightness.light,
        deleteIconColor: AppColors.chipDeleteLight,
        disabledColor: AppColors.chipDisabledLight,
        labelPadding: const EdgeInsets.only(left: 8, right: 8),
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: AppColors.chipLabelLight,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        padding: const EdgeInsets.all(4),
        secondaryLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: font,
          color: AppColors.chipSecondaryLabelLight,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        secondarySelectedColor: AppColors.chipSecondarySelectedLight,
        selectedColor: AppColors.chipSelectedLight,
        shape: const StadiumBorder(
          side: BorderSide(
            color: AppColors.chipShapeLight,
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
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
