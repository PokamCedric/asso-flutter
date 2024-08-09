import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 296,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDefaults.padding * 1.5,
                      ),
                      child: SvgPicture.asset(Images.logo),
                    ),
                    Text(
                      'Page Not Found',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapH24,
                    Text(
                      'The page you are looking for does not exist.',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapH24,
                    SizedBox(
                      width: 296,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.dashboard),
                        child: const Text('Go to Dashboard'),
                      ),
                    ),
                    gapH24,
                    Text(
                      'If you believe this is an error, please contact support.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    gapH24,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
