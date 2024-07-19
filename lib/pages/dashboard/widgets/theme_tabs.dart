import 'package:core_dashboard/app_bloc.dart';
import 'package:core_dashboard/blocs/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:core_dashboard/configs/theme.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:core_dashboard/shared/widgets/tabs/tab_with_icon.dart';

class ThemeTabs extends StatefulWidget {
  const ThemeTabs({super.key});

  @override
  State<ThemeTabs> createState() => _ThemeTabsState();
}

class _ThemeTabsState extends State<ThemeTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = AppTheme.darkThemeOption == DarkOption.alwaysOn ? 1 : 0;

    _tabController = TabController(length: 2, vsync: this, initialIndex: _selectedIndex)      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
          _onTabChanged(_selectedIndex);
        });
      });

    super.initState();
  }

  /// On Change Theme based on tab selection
  void _onTabChanged(int index) {
    if (index == 0) {
      // Light theme tab selected
      _onChangeDarkOption(DarkOption.alwaysOff);
    } else if (index == 1) {
      // Dark theme tab selected
      _onChangeDarkOption(DarkOption.alwaysOn);
    }
  }

  ///On Change Dark Option
  void _onChangeDarkOption(DarkOption darkOption) {
    AppBloc.themeBloc.add(OnChangeTheme(darkOption: darkOption));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
      ),
      child: TabBar(
        controller: _tabController,
        dividerHeight: 0,
        splashBorderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding * 0.5,
          vertical: AppDefaults.padding * 0.5,
        ),
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDefaults.borderRadius * 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          color: Theme.of(context).cardColor,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          TabWithIcon(
            isSelected: _selectedIndex == 0,
            iconSrc: 'assets/icons/sun_filled.svg',
          ),
          TabWithIcon(
            isSelected: _selectedIndex == 1,
            iconSrc: 'assets/icons/moon_light.svg',
          ),
        ],
      ),
    );
  }
}
