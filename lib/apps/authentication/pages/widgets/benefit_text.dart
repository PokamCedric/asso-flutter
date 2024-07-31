import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/constants/extensions.dart';
import 'package:african_windows/configs/theme/app_colors.dart';
import 'package:african_windows/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BenefitText extends StatelessWidget {
  const BenefitText({
    super.key,
    this.isTitle = false,
    required this.title,
    this.icon = Images.iconCheckCircledLight,
  });

  final bool isTitle;

  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
      ),
      leading: isTitle
          ? null
          : SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
              colorFilter: AppColors.success.toColorFilter,
            ),
      title: Text(
        title,
        style: isTitle
            ? Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)
            : null,
      ),
      titleAlignment: ListTileTitleAlignment.titleHeight,
    );
  }
}
