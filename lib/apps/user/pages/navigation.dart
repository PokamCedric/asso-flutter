

import 'package:african_windows/core/utils/images.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/widgets/sidemenu/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserNavigation extends StatelessWidget {

  const UserNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
                      leading: SvgPicture.asset(Images.profileCircledLight),
                      title: Text(
                        "Users",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isSubmenu: true,
                          title: "List",
                          count: 16,
                          onPressed:  () => Get.toNamed(Routes.users)
                        ),
                      ],
                    );
  }
}