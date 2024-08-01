import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'widgets/signup_benefits.dart';
import 'widgets/signup_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Row(
          children: [
            if (!Responsive.isMobile(context))
              Expanded(
                flex: Responsive.isTablet(context) ? 2 : 1,
                child: Container(
                  color: AppColors.bgLight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// APP LOGO
                      if (!Responsive.isMobile(context))
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding,
                            vertical: AppDefaults.padding * 1.5,
                          ),
                          child: SvgPicture.asset(Images.logo),
                        ),

                      /// SIGNUP BENEFITS
                      const Expanded(child: SignupBenefits()),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// APP LOGO
                      Responsive.isMobile(context)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDefaults.padding,
                                vertical: AppDefaults.padding * 1.5,
                              ),
                              child: SvgPicture.asset(Images.logo),
                            )
                          : const SizedBox(),

                      /// LOGIN TEXT
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding,
                          vertical: AppDefaults.padding * 1.5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Already a member?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.textGrey),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  color: AppColors.titleLight,
                                ),
                              ),
                              onPressed: () => nav.navigateTo(Routes.signin),
                              child: const Text('Sign in'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// SIGNUP FORM
                  const Expanded(child: SignupForm()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
