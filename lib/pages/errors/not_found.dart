import 'package:african_windows/configs/application.dart';
import 'package:african_windows/controllers/navigation_controller.dart';
import 'package:african_windows/shared/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/constants/gaps.dart';
import 'package:provider/provider.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: SvgPicture.asset(AppConfig.logo),
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
                        onPressed: () => nav.navigateTo(Routes.dashboard),
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
