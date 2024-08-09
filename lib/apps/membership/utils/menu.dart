

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:african_windows/core/widgets/sidemenu/menu_tile.dart';

class UserNavigation extends StatelessWidget {

  const UserNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
                      leading: SvgPicture.asset(Images.profileCircledLight),
                      title: Text(
                        "Membership",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isSubmenu: true,
                          title: "Members",
                          count: 16,
                          onPressed:  () => Get.toNamed(MembershipRoutes.users)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Activities",
                          count: 16,
                          onPressed:  () => Get.toNamed(MembershipRoutes.users)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Sanctions",
                          count: 16,
                          onPressed:  () => Get.toNamed(MembershipRoutes.users)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Charges",
                          count: 16,
                          onPressed:  () => Get.toNamed(MembershipRoutes.users)
                        ),
                      ],
                    );
  }
}