import 'package:african_windows/apps/membership/members/models/model_user.dart';
import 'package:african_windows/apps/membership/members/pages/add.dart';
import 'package:african_windows/apps/membership/members/pages/edit.dart';
import 'package:african_windows/apps/authentication/pages/register_page.dart';
import 'package:african_windows/apps/authentication/pages/sign_in_page.dart';
import 'package:african_windows/apps/dashboard/pages/dashboard_page.dart';
import 'package:african_windows/apps/membership/members/pages/home.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/core/utils/navigation/auth_middleware.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String notFound = "/not-found";
  static const String signin = "/sign-in";
  static const String register = "/register";
  static const String users = "/users";
  static const String userAdd = "/user-add";
  static const String userEdit = "/user-edit";

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
      GetPage(
        name: users,
        page: () => const UserListingPage(),
        middlewares: [AuthMiddleware(adminOnly: true)],
      ),
      GetPage(
        name: userAdd,
        page: () => const UserAddPage(),
        middlewares: [AuthMiddleware(adminOnly: true)],
      ),
      GetPage(
        name: userEdit,
        page: () => UserEditPage(user: Get.arguments as UserModel),
        middlewares: [AuthMiddleware(adminOnly: true)],
      ),
      GetPage(
        name: notFound,
        page: () => const NotFoundPage(),
      ),
    ];
  }
}
