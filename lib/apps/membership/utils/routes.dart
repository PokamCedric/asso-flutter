// user_routes.dart
import 'package:get/get.dart';
import 'package:african_windows/apps/membership/members/pages/add.dart';
import 'package:african_windows/apps/membership/members/pages/edit.dart';
import 'package:african_windows/apps/membership/members/pages/home.dart';
import 'package:african_windows/apps/membership/members/models/model_user.dart';

class MembershipRoutes {
  static const String users = "/users";
  static const String userAdd = "/users/add";
  static const String userEdit = "/users/edit/:id";

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: users,
        page: () => const UserListingPage(),
      ),
      GetPage(
        name: userAdd,
        page: () => const UserAddPage(),
      ),
      GetPage(
        name: userEdit,
        page: () => UserEditPage(user: Get.arguments as UserModel),
      ),
    ];
  }
}
