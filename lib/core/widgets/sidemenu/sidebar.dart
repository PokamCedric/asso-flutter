import 'package:african_windows/apps/user/pages/navigation.dart';
import 'package:african_windows/apps/dashboard/pages/widgets/theme_tabs.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/widgets/sidemenu/customer_info.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'menu_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      // width: Responsive.isMobile(context) ? double.infinity : null,
      // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(Images.closeFilled),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                    vertical: AppDefaults.padding * 1.5,
                  ),
                  child: SvgPicture.asset(Images.logo),
                ),
              ],
            ),
            const Divider(),
            gapH16,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding,
                ),
                child: ListView(
                  children: [
                    MenuTile(
                      isActive: true,
                      title: "Home",
                      activeIconSrc: Images.homeFilled,
                      inactiveIconSrc: Images.homeLight,
                      onPressed: () {},
                    ),
                    const UserNavigation(),
                    MenuTile(
                      title: "Shop",
                      activeIconSrc: Images.storeLight,
                      inactiveIconSrc: Images.storeFilled,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                children: [
                  if (Responsive.isMobile(context))
                    const CustomerInfo(
                      name: 'Cédric Joel',
                      designation: 'Software Developer',
                      imageSrc: Images.customer
                      ),
                  gapH8,
                  const Divider(),
                  gapH8,
                  Row(
                    children: [
                      SvgPicture.asset(
                        Images.helpLight,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      gapW8,
                      Text(
                        'Help & getting started',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Chip(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(horizontal: 0.5),
                        label: Text(
                          "8",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  gapH20,
                  const ThemeTabs(),
                  gapH8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
