import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> children;

  const Breadcrumb({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < children.length; i++) {
      var item = children[i];
      if (item.active || item.route == null) {
        list.add(Text(
              children[i].name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    letterSpacing: 0,
                  ),
            ));
      } else {
        list.add(InkWell(
            onTap: () => {
                  if (item.route != null)
                    Get.offNamed(item.route!)
                },
            child:
            Text(
              children[i].name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    letterSpacing: 0,
                    color: Theme.of(context).primaryColor
                  ),
            )
        ));
      }
      if (i < children.length - 1) {
        list.add(gapW16);
        list.add(const Text(">"));
        list.add(gapW16);
      }
    }
    return (Responsive.isMobile(context))
          ? const SizedBox()
          : Row(mainAxisSize: MainAxisSize.min, children: list);
  }
}
