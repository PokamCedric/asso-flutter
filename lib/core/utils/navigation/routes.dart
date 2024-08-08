import 'package:african_windows/apps/user/models/model_user.dart';
import 'package:african_windows/apps/user/pages/add.dart';
import 'package:african_windows/apps/user/pages/edit.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/apps/authentication/pages/register_page.dart';
import 'package:african_windows/apps/authentication/pages/sign_in_page.dart';
import 'package:african_windows/apps/dashboard/pages/dashboard_page.dart';
import 'package:african_windows/apps/user/pages/home.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/core/utils/navigation/authenticate_route.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String notFound = "/not-found";
  static const String signin = "/sign-in";
  static const String register = "/register";
  static const String users = "/users";
  static const String userAdd = "/user-add";
  static const String userEdit = "/user-edit";

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

      case users:
        return AuthenticatedRoute(
          builder: (context) => const UserListingPage(),
          adminOnly: true,
          settings: settings,
        );
      case userAdd:
        return AuthenticatedRoute(
          builder: (context) => const UserAddPage(),
          adminOnly: true,
          settings: settings,
        );
      case userEdit:
        final UserModel user = settings.arguments as UserModel;
        return AuthenticatedRoute(
          builder: (context) => UserEditPage(user: user),
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
