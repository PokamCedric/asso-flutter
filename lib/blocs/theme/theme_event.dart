import 'package:african_windows/configs/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:african_windows/models/model_theme.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnChangeTheme extends ThemeEvent {
  final ThemeModel? theme;
  final String? font;
  final DarkOption? darkOption;

  OnChangeTheme({
    this.theme,
    this.font,
    this.darkOption,
  });

  @override
  List<Object?> get props => [theme, font, darkOption];
}
