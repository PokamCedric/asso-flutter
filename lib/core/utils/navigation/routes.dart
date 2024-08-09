import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/utils/navigation/authenticate_route.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/apps/dashboard/pages/dashboard_page.dart';
import 'package:african_windows/apps/authentication/pages/sign_in_page.dart';
import 'package:african_windows/apps/authentication/pages/register_page.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String notFound = "/not-found";
  static const String signin = "/sign-in";
  static const String register = "/register";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return AuthenticatedRoute(
          builder: (context) => const DashboardPage(),
          adminOnly: false,
          settings: settings,
        );
      case dashboard:
        return AuthenticatedRoute(
          builder: (context) => const DashboardPage(),
          adminOnly: false,
          settings: settings,
        );
      case signin:
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterPage());

      case MembershipRoutes.base:
      case MembershipRoutes.add:
      case MembershipRoutes.edit:
        return MembershipRoutes().generateRoute(settings);

      case notFound:
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }

  // Singleton factory
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();
}
