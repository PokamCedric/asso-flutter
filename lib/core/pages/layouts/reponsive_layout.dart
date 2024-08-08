import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/pages/layouts/layout.dart';
import 'package:african_windows/core/pages/layouts/widgets/breadcrumb.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final List<Widget> mainContent;
  final List<Widget> filterContent;
  final List<BreadcrumbItem> breadcrumbItems;
  final String title;

  const ResponsiveLayout({
    super.key,
    required this.mainContent,
    required this.filterContent,
    required this.title,
    this.breadcrumbItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                if(breadcrumbItems.isNotEmpty)
                  Breadcrumb(children: breadcrumbItems)
                ],
              ),
            ),
          gapH20,
          LayoutBuilder(
            builder: (context, constraints) {
              if (!Responsive.isMobile(context)) {
                // Desktop view
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: mainContent,
                      ),
                    ),
                    gapW16,
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: filterContent,
                      ),
                    ),
                  ],
                );
              } else {
                // Mobile view
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...filterContent,
                    gapH16,
                    ...mainContent,
                  ],
                );
              }
            },
          ),
          gapH20,
        ],
      ),
    );
  }
}
