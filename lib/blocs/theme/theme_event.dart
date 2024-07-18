import 'package:core_dashboard/configs/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:core_dashboard/models/model_theme.dart';

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
