import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/apps/authentication/services/auth_services.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/extensions.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'widgets/social_login_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController(text: 'cedric@asso.com');
  final TextEditingController _passwordController = TextEditingController(text: '1234567');

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);
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
                      'Sign In',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapH24,
                    Text(
                      'Sign up with Open account',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapH24,
                    SocialLoginButton(
                      onGoogleLoginPressed: () {},
                      onAppleLoginPressed: () {},
                    ),
                    gapH24,
                    const Divider(),
                    gapH24,
                    Text(
                      'Or continue with email address',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapH16,

                    /// EMAIL TEXT FIELD
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: SvgPicture.asset(
                          Images.iconMailLight,
                          height: 16,
                          width: 20,
                          fit: BoxFit.none,
                        ),
                        suffixIcon: SvgPicture.asset(
                          Images.iconCheckFilled,
                          width: 17,
                          height: 11,
                          fit: BoxFit.none,
                          colorFilter: AppColors.success.toColorFilter,
                        ),
                        hintText: 'Your email',
                      ),
                    ),
                    gapH16,

                    /// PASSWORD TEXT FIELD
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: SvgPicture.asset(
                          Images.iconLockLight,
                          height: 16,
                          width: 20,
                          fit: BoxFit.none,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    gapH16,

                    /// SIGN IN BUTTON
                    SizedBox(
                      width: 296,
                      child: ElevatedButton(
                        onPressed: () async {
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          // Perform sign-in
                          final errors = await AuthService.loginUserModel({
                            'email': email,
                            'password': password,
                          });

                          if (errors == null) {
                            nav.navigateTo(Routes.dashboard); // Navigate to dashboard on success
                          } else {
                            // Handle error display
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Sign-In Error'),
                                content: Text(errors.values.join(', ')),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Sign in'),
                      ),
                    ),
                    gapH24,

                    /// FOOTER TEXT
                    Text(
                      'This site is protected by reCAPTCHA and the Google Privacy Policy.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    gapH24,

                    /// SIGNUP TEXT
                    Row(
                      children: [
                        Text(
                          'Don’t have an account?',
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
                          onPressed: () => nav.navigateTo(Routes.register),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
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
