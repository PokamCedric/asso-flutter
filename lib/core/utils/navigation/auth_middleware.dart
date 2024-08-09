// // auth_middleware.dart

// import 'package:flutter/material.dart';
// import 'package:african_windows/apps/authentication/services/auth_services.dart';
// import 'package:african_windows/core/utils/navigation/routes.dart';
// import 'package:get/get.dart';

// class AuthMiddleware extends GetMiddleware {
//   final bool adminOnly;

//   AuthMiddleware({this.adminOnly = false});

//   @override
//   RouteSettings? redirect(String? route) {
//     if (!AuthService.isLoggedIn) {
//       return const RouteSettings(name: Routes.signin);
//     }

//     if (adminOnly && !AuthService.isAdmin) {
//       return const RouteSettings(name: Routes.notFound);
//     }

//     return null;
//   }
// }
