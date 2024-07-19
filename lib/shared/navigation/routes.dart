import 'package:flutter/material.dart';
import 'package:core_dashboard/pages/authentication/register_page.dart';
import 'package:core_dashboard/pages/authentication/sign_in_page.dart';
import 'package:core_dashboard/pages/dashboard/dashboard_page.dart';
import 'package:core_dashboard/pages/jobs/job_page.dart';
import 'package:core_dashboard/services/auth_services.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn
        ? null
        : const RouteSettings(name: '/sign-in');
  }
}

List<GetPage> getPageRoute() {
  return [
    GetPage(
      name: '/',
      page: () => const DashboardPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/dashboard',
      page: () => const DashboardPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/jobs',
      page: () => const JobListingPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: '/sign-in', page: () => SignInPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
  ];
}
