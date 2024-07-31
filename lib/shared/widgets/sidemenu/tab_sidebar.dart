import 'package:african_windows/configs/theme/theme.dart';
import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/constants/gaps.dart';
import 'package:african_windows/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/blocs/theme/theme_event.dart';

import 'icon_tile.dart';
import 'theme_icon_tile.dart';

class TabSidebar extends StatefulWidget {
  const TabSidebar({super.key});

  @override
  State<TabSidebar> createState() => _TabSidebarState();
}

class _TabSidebarState extends State<TabSidebar> {
  bool isDark = AppTheme.darkThemeOption == DarkOption.alwaysOn;

  void _toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
    AppBloc.themeBloc.add(OnChangeTheme(darkOption: isDark ? DarkOption.alwaysOn : DarkOption.alwaysOff));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 96,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
                vertical: AppDefaults.padding * 1.5),
            child: SvgPicture.asset(Images.logo),
          ),
          gapH16,
          Expanded(
            child: SizedBox(
              width: 48,
              child: ListView(
                children: [
                  IconTile(
                    isActive: true,
                    activeIconSrc: Images.homeFilled,
                    inactiveIconSrc: Images.homeLight,
                    onPressed: () {},
                  ),
                  gapH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: Images.diamondFilled,
                    inactiveIconSrc: Images.diamondLight,
                    onPressed: () {},
                  ),
                  gapH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: Images.profileCircledFilled,
                    inactiveIconSrc: Images.profileCircledLight,
                    onPressed: () {},
                  ),
                  gapH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: Images.storeFilled,
                    inactiveIconSrc: Images.storeLight,
                    onPressed: () {},
                  ),
                  gapH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: Images.pieChartFilled,
                    inactiveIconSrc: Images.pieChartLight,
                    onPressed: () {},
                  ),
                  gapH4,
                  IconTile(
                    isActive: false,
                    activeIconSrc: Images.promotionFilled,
                    inactiveIconSrc: Images.promotionLight,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconTile(
                isActive: false,
                activeIconSrc: Images.arrowForwardLight,
                onPressed: () {},
              ),
              const SizedBox(
                width: 48,
                child: Divider(thickness: 2),
              ),
              gapH4,
              IconTile(
                isActive: false,
                activeIconSrc: Images.helpLight,
                onPressed: () {},
              ),
              gapH4,
              ThemeIconTile(
                isDark: isDark,
                onPressed: _toggleTheme,
              ),
              gapH16,
            ],
          )
        ],
      ),
    );
  }
}
