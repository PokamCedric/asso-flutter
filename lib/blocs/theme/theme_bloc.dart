import 'package:african_windows/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/blocs/theme/theme_event.dart';
import 'package:african_windows/blocs/theme/theme_state.dart';
import 'package:african_windows/configs/app_theme.dart';
import 'package:african_windows/configs/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialThemeState()) {
    on<OnChangeTheme>(_mapOnChangeThemeEventToState);
  }

  void _mapOnChangeThemeEventToState(OnChangeTheme event, Emitter<ThemeState> emit) {
    emit(ThemeUpdating());

    // Update theme style and font
    if (event.theme != null) {
      AppTheme.currentTheme = event.theme!;
    }
    if (event.font != null) {
      AppTheme.currentFont = event.font!;
    }
    if (event.darkOption != null) {
      AppTheme.darkThemeOption = event.darkOption!;
    }

    LocalStorage.setDarkOption(AppTheme.darkThemeOption);

    Brightness lightBrightness = Brightness.light;
    Brightness darkbrightness = Brightness.dark;

    // Setup Theme with setting darkOption
    switch (AppTheme.darkThemeOption) {
      case DarkOption.dynamic:
          lightBrightness = Brightness.light;
          darkbrightness = Brightness.dark;
      break;

      case DarkOption.alwaysOn:
          lightBrightness = Brightness.dark;
          darkbrightness = Brightness.dark;
        break;
      case DarkOption.alwaysOff:
          lightBrightness = Brightness.light;
          darkbrightness = Brightness.light;
        break;
    }

    AppTheme.lightTheme = CollectionTheme.getCollectionTheme(
          colorSeed: AppTheme.currentTheme.colorSeed!,
          font: AppTheme.currentFont,
          brightness: lightBrightness,
    );

    AppTheme.darkTheme = CollectionTheme.getCollectionTheme(
          colorSeed: AppTheme.currentTheme.colorSeed!,
          font: AppTheme.currentFont,
          brightness: darkbrightness,
    );


    // Notify UI
    emit(ThemeUpdated());
  }

}
