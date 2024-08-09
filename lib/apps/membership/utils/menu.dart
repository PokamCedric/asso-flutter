

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:african_windows/core/widgets/sidemenu/menu_tile.dart';
import 'package:provider/provider.dart';

class MemberNavigation extends StatelessWidget {

  const MemberNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);

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
                          onPressed:  () => nav.navigateTo(MembershipRoutes.base)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Activities",
                          count: 16,
                          onPressed:  () => nav.navigateTo(MembershipRoutes.base)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Sanctions",
                          count: 16,
                          onPressed:  () => nav.navigateTo(MembershipRoutes.base)
                        ),
                        MenuTile(
                          isSubmenu: true,
                          title: "Charges",
                          count: 16,
                          onPressed:  () => nav.navigateTo(MembershipRoutes.base)
                        ),
                      ],
                    );
  }
}