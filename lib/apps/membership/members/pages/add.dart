import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/apps/membership/members/pages/widgets/add_body.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';

class MemberAddPage extends StatelessWidget {
  const MemberAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      title: 'Add Member',
      breadcrumbItems:  [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Members", route: MembershipRoutes.base),
        BreadcrumbItem(name: "Add", route: MembershipRoutes.add, active: true),
      ],
      mainContent: [
        MemberAddBody(),
      ],
      filterContent: [],
    );
  }
}
