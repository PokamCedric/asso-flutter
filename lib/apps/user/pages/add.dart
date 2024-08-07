import 'package:flutter/material.dart';
import 'package:african_windows/apps/user/pages/widgets/add_body.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      title: 'Add User',
      mainContent: [
        UserAddBody(),
      ],
      filterContent: [],
    );
  }
}
