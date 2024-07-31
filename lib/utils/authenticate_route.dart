import 'package:african_windows/controllers/navigation_controller.dart';
import 'package:african_windows/apps/authentication/services/auth_services.dart';
import 'package:african_windows/shared/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticatedRoute extends MaterialPageRoute {
  final bool adminOnly;

  AuthenticatedRoute({
    required super.builder,
    this.adminOnly = false,
    super.settings,
  });

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child; // Default transition behavior
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return AuthCheck(
      adminOnly: adminOnly,
      child: super.buildPage(context, animation, secondaryAnimation),
    );
  }
}

class AuthCheck extends StatelessWidget {
  final Widget child;
  final bool adminOnly;

  const AuthCheck({super.key,
    required this.child,
    this.adminOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);

    if (AuthService.isLoggedIn) {
      if(adminOnly && !AuthService.isAdmin) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
        nav.navigateAndReplace(Routes.notFound);
        });
        return Container(); // Return an empty container temporarily
      }
      return child;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        nav.navigateAndReplace(Routes.signin);
      });
      return Container(); // Return an empty container temporarily
    }
  }


}
