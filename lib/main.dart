import 'package:core_dashboard/configs/app_theme.dart';
import 'package:core_dashboard/shared/navigation/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CollectionTheme.getCollectionTheme(
        theme: "primaryLight",
        colorSeed: ColorSeed.blue, // Choose any ColorSeed
      ),
      darkTheme: CollectionTheme.getCollectionTheme(
        theme: "primaryDark",
        colorSeed: ColorSeed.blue, // Choose any ColorSeed
      ),
      themeMode: ThemeMode.system, // Choose the system theme mode
      routerConfig: routerConfig,
    );
  }
}

