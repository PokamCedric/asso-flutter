import 'package:african_windows/pages/authentication/register_page.dart';
import 'package:african_windows/pages/authentication/sign_in_page.dart';
import 'package:african_windows/pages/dashboard/dashboard_page.dart';
import 'package:african_windows/pages/errors/not_found.dart';
import 'package:african_windows/pages/jobs/job_page.dart';
import 'package:african_windows/utils/authenticate_route.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String signin = "/sign-in";
  static const String register = "/register";
  static const String jobslist = "/jobs-list";
  static const String notFound = "/not-found";


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
          case notFound:
            return MaterialPageRoute(builder: (context) => const NotFoundPage());
          case jobslist:
            return AuthenticatedRoute(
              builder: (context) => const JobListingPage(),
              adminOnly: true,
              settings: settings,
            );
          default:
            return MaterialPageRoute(builder: (context) => const NotFoundPage());
        }
  }

  ///Singleton factory
  static final Routes _instance = Routes._internal();

  factory Routes() {
    return _instance;
  }

  Routes._internal();
}
