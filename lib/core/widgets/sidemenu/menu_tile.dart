import 'package:african_windows/core/constants/defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.title,
    required this.onPressed,
    this.activeIconSrc,
    this.inactiveIconSrc,
    this.isActive = false,
    this.isSubmenu = false,
    this.count,
  });

  final String title;
  final String? inactiveIconSrc, activeIconSrc;
  final VoidCallback onPressed;
  final bool isActive, isSubmenu;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isSubmenu ? AppDefaults.padding * 2 : 0,
          right: isSubmenu ? AppDefaults.padding : 0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).highlightColor : null,
          borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Theme.of(context).indicatorColor.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
          ],
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
          ),
          onTap: onPressed,
          leading: activeIconSrc != null
              ? SvgPicture.asset(
                  (isActive || inactiveIconSrc == null)
                      ? activeIconSrc!
                      : inactiveIconSrc!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? Theme.of(context).iconTheme.color!
                          : Theme.of(context).textTheme.bodyMedium!.color!,
                      BlendMode.srcIn),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? Theme.of(context).primaryColor : null,
            ),
          ),
          trailing: count != null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding / 2,
                      vertical: AppDefaults.padding / 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius:
                        BorderRadius.circular(AppDefaults.borderRadius / 2),
                  ),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
