import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/pages/responsive.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/defaults.dart';
import '../constants/gaps.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.drawerKey});

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding, vertical: AppDefaults.padding),
      color: Theme.of(context).cardColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (Responsive.isMobile(context))
              IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: Badge(
                  isLabelVisible: false,
                  child: SvgPicture.asset(
                    Images.menuLight,
                  ),
                ),
              ),
            if (Responsive.isMobile(context))
              IconButton(
                onPressed: () {},
                icon: Badge(
                  isLabelVisible: false,
                  child: SvgPicture.asset(Images.searchFilled),
                ),
              ),
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 1,
                child: TextFormField(
                  // style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: AppDefaults.padding,
                          right: AppDefaults.padding / 2),
                      child: SvgPicture.asset(Images.searchLight),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: AppDefaults.outlineInputBorder,
                    focusedBorder: AppDefaults.focusedOutlineInputBorder,
                  ),
                ),
              ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!Responsive.isMobile(context))
                    IconButton(
                      onPressed: () {},
                      icon: Badge(
                        isLabelVisible: true,
                        child:
                            SvgPicture.asset(Images.messageLight),
                      ),
                    ),
                  if (!Responsive.isMobile(context)) gapW16,
                  if (!Responsive.isMobile(context))
                    IconButton(
                      onPressed: () {},
                      icon: Badge(
                        isLabelVisible: true,
                        child: SvgPicture.asset(
                            Images.notificationLight),
                      ),
                    ),
                  if (!Responsive.isMobile(context)) gapW16,
                  if (!Responsive.isMobile(context))
                    IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundImage: NetworkImage(Images.customer),
                        ),
                    ),
                  TextButton(
                    onPressed: () => nav.navigateTo(Routes.signin),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.titleLarge!.color,
                      minimumSize: const Size(80, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppDefaults.borderRadius),
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text("Sign In"),
                  ),
                  gapW16,
                  ElevatedButton(
                    onPressed: () => nav.navigateTo(Routes.register),
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
