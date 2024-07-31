import 'package:african_windows/core/configs/theme/app_theme.dart';

class ThemeModel {
  final String? name;
  final ColorSeed? colorSeed;

  ThemeModel(
    {
      this.name,
      this.colorSeed,
    }
  );

  factory ThemeModel.fromJson(Map json) {
    return ThemeModel(
      name: json['name'] as String? ?? "Unknown",
      colorSeed: json['colorSeed'] as ColorSeed? ?? ColorSeed.baseColor,
    );
  }
}
