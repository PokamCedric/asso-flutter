import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeIconTile extends StatefulWidget {
  const ThemeIconTile({super.key, this.isDark = false, required this.onPressed});

  final bool isDark;
  final VoidCallback  onPressed;

  @override
  State<ThemeIconTile> createState() => _ThemeIconTileState();
}

class _ThemeIconTileState extends State<ThemeIconTile> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color:
            _isHover ? AppColors.highlightLight : AppColors.highlightLight.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(AppDefaults.padding * 0.25),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (value) {
          setState(() {
            _isHover = value;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.highlightLight,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.isDark
                  ? Images.moonLight
                  : Images.sunFilled,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.iconBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
