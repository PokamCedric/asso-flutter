import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDefaults {
  static const double padding = 16.0;
  static const double borderRadius = 8.0;
  static const double inputFieldRadius = 12.0;
  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDefaults.borderRadius),
      ),
      borderSide: BorderSide.none);
  static BoxDecoration decoration = BoxDecoration(
    border: Border.all(),
    borderRadius: const BorderRadius.all(
        Radius.circular(AppDefaults.borderRadius),
      ));
  static OutlineInputBorder focusedOutlineInputBorder = outlineInputBorder
      .copyWith(borderSide: const BorderSide(width: 2));
}
