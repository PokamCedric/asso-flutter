// routes.dart
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:get/get.dart';
import 'package:african_windows/apps/dashboard/pages/dashboard_page.dart';
import 'package:african_windows/apps/authentication/pages/register_page.dart';
import 'package:african_windows/apps/authentication/pages/sign_in_page.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/core/utils/navigation/auth_middleware.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String notFound = "/not-found";
  static const String signin = "/sign-in";
  static const String register = "/register";

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: initial,
        page: () => const DashboardPage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: dashboard,
        page: () => const DashboardPage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: signin,
        page: () => const SignInPage(),
      ),
      GetPage(
        name: register,
        page: () => const RegisterPage(),
      ),
      // Integrate the user routes from the micro-app
      ...MembershipRoutes.getPages(),
      GetPage(
        name: notFound,
        page: () => const NotFoundPage(),
      ),
    ];
  }
}
