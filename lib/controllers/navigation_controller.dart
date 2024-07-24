import 'package:flutter/material.dart';

class NavigationController {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate to the specified route
  void navigateTo(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  // Navigate to the specified route and remove all previous routes
  void navigateAndReplace(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  // Go back to the previous route
  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
