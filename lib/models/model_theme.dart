import 'package:flutter/material.dart';

class ThemeModel {
  final String? name;
  final Color? color;
  final String? lightTheme;
  final String? darkTheme;

  ThemeModel(
    {
      this.name,
      this.color,
      this.lightTheme,
      this.darkTheme
    }
  );

  factory ThemeModel.fromJson(Map json) {
    return ThemeModel(
      name: json['name'] as String? ?? "Unknown",
      color: json['color'] as Color? ?? Colors.black,
      lightTheme: json['light'] as String? ?? "Unknown",
      darkTheme: json['dark'] as String? ?? "Unknown",
    );
  }
}
