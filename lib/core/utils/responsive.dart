import 'package:flutter/material.dart';

class Responsive {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1280 &&
      MediaQuery.of(context).size.width >= 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

}
