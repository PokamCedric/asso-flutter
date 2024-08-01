import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/pages/layouts/layout.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mainContent;
  final Widget filterContent;
  final String title;

  const ResponsiveLayout({
    super.key,
    required this.mainContent,
    required this.filterContent,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) gapH24,
          Text(
            title,
            style: Theme.of(context)
            .textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.w600),
          ),
          gapH20,
          LayoutBuilder(
            builder: (context, constraints) {
              if (!Responsive.isMobile(context)) {
                // Desktop view
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: mainContent),
                    gapW16,
                    Expanded(flex: 2, child: filterContent),
                  ],
                );
              } else {
                // Mobile view
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    filterContent,
                    gapH16,
                    mainContent,
                  ],
                );
              }
            },
          ),
          gapH20,
        ]
      ),
    );
  }
}
