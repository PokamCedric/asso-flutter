import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/apps/membership/members/pages/widgets/add_body.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      title: 'Add User',
      breadcrumbItems:  [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Users", route: Routes.users),
        BreadcrumbItem(name: "Add", route: Routes.userAdd, active: true),
      ],
      mainContent: [
        UserAddBody(),
      ],
      filterContent: [],
    );
  }
}
