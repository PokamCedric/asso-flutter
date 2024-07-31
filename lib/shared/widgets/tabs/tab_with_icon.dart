import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabWithIcon extends StatelessWidget {
  const TabWithIcon({
    super.key,
    this.title,
    required this.iconSrc,
    this.isSelected = false,
  });

  final bool isSelected;

  final String? title;
  final String iconSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppDefaults.padding * 0.25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconSrc,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              isSelected ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
              BlendMode.srcIn,
            ),
          ),
          gapW4,
          Text(
            title??"",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSelected ? Theme.of(context).primaryColor : null,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
