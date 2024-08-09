import 'package:african_windows/apps/membership/members/models/model_member.dart';
import 'package:african_windows/apps/membership/members/pages/widgets/edit_body.dart';
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';

class MemberEditPage extends StatelessWidget {
  final MemberModel member;
  const MemberEditPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      title: 'Edit ${member.toString()}',
      breadcrumbItems: const [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Members", route: MembershipRoutes.base),
        BreadcrumbItem(name: "Edit", route: MembershipRoutes.edit, active: true),
      ],
      mainContent: [
        MemberEditBody(member: member),
      ],
      filterContent: const [],
    );
  }
}
