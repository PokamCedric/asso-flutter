import 'package:flutter/material.dart';
import 'package:african_windows/apps/authentication/pages/register_page.dart';
import 'package:african_windows/apps/authentication/pages/sign_in_page.dart';
import 'package:african_windows/apps/dashboard/pages/dashboard_page.dart';
import 'package:african_windows/apps/user/pages/home.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/apps/job/pages/home.dart';
import 'package:african_windows/core/utils/navigation/authenticate_route.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String jobs = "/jobs";
  static const String notFound = "/not-found";
  static const String signin = "/sign-in";
  static const String register = "/register";
  static const String users = "/users";

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
      case jobs:
        return AuthenticatedRoute(
          builder: (context) => const JobListingPage(),
          adminOnly: true,
          settings: settings,
        );
      case users:
        return AuthenticatedRoute(
          builder: (context) => const UserListingPage(),
          adminOnly: true,
          settings: settings,
        );
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
