import 'package:african_windows/shared/constants/gaps.dart';
import 'package:african_windows/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.onGoogleLoginPressed,
    this.onAppleLoginPressed,
  });

  final Function()? onGoogleLoginPressed, onAppleLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          onPressed: onGoogleLoginPressed,
          child: Row(
            children: [
              SvgPicture.asset(Images.iconGoogleFilled),
              gapW8,
              const Text('Google')
            ],
          ),
        ),
        gapW8,
        OutlinedButton(
          onPressed: onAppleLoginPressed,
          child: Row(
            children: [
              SvgPicture.asset(Images.iconAppleIc),
              gapW8,
              const Text('Apple ID')
            ],
          ),
        ),
      ],
    );
  }
}
