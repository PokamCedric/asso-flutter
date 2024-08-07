import 'package:flutter/material.dart';
import 'package:african_windows/apps/user/pages/widgets/edit_body.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:flutter/widgets.dart';


class UserEditPage extends StatelessWidget {
  const UserEditPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ResponsiveLayout(
      title: 'Edit User',
      mainContent: [
        EditBody(
          textFirstNameController: TextEditingController(),
          textLastNameController: TextEditingController(),
          textEmailController: TextEditingController(),
          textPhoneController: TextEditingController(),
          textAddressController: TextEditingController(),
        ),
      ],
      filterContent: const [],
    );
  }
}
