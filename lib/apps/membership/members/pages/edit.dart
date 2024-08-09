import 'package:african_windows/apps/membership/members/models/model_user.dart';
import 'package:african_windows/apps/membership/members/pages/widgets/edit_body.dart';
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';

class UserEditPage extends StatelessWidget {
  final UserModel user;
  const UserEditPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      title: 'Edit ${user.toString()}',
      breadcrumbItems: const [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Users", route: MembershipRoutes.users),
        BreadcrumbItem(name: "Edit", route: MembershipRoutes.userEdit, active: true),
      ],
      mainContent: [
        UserEditBody(user: user),
      ],
      filterContent: const [],
    );
  }
}
