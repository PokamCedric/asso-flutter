import 'package:african_windows/apps/user/pages/widgets/edit_body.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';


class UserEditPage extends StatelessWidget {
  const UserEditPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const ResponsiveLayout(
      title: 'Edit User',
      mainContent: [
        CardLayout(child: EditBody()),
      ],
      filterContent: [
      ],
    );
  }
}
