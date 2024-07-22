import 'package:african_windows/responsive.dart';
import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/widgets/sidemenu/sidebar.dart';
import 'package:african_windows/shared/widgets/sidemenu/tab_sidebar.dart';
import 'package:flutter/material.dart';
import '../shared/widgets/header.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Responsive.isMobile(context) ? const Sidebar() : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const Sidebar(),
          if (Responsive.isTablet(context)) const TabSidebar(),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: drawerKey),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding *
                                (Responsive.isMobile(context) ? 1 : 1.5),
                          ),
                          child: SafeArea(child: child),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
