// import 'package:flutter/material.dart';
// import '../configs/app_theme.dart';

// class ThemeNotifier extends ChangeNotifier {
//   ThemeData _currentTheme;
//   bool _isDarkMode;

//   ThemeNotifier() :
//     _isDarkMode = false,
//     _currentTheme = AppTheme.light(null);

//   bool get isDarkMode => _isDarkMode;

//   ThemeData get currentTheme => _currentTheme;

//   void switchTheme(bool isDark) {
//     _isDarkMode = isDark;
//     _currentTheme = isDark ? AppTheme.dark(null) : AppTheme.light(null);
//     notifyListeners();
//   }
// }
