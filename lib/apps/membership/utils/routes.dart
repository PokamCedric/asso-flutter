import 'package:flutter/material.dart';
import 'package:african_windows/apps/membership/members/pages/add.dart';
import 'package:african_windows/apps/membership/members/pages/edit.dart';
import 'package:african_windows/apps/membership/members/pages/home.dart';
import 'package:african_windows/apps/membership/members/models/model_member.dart';
import 'package:african_windows/core/pages/errors/not_found.dart';
import 'package:african_windows/core/utils/navigation/authenticate_route.dart';

class MembershipRoutes {
  static const String base = "/members";
  static const String add = "/members/add";
  static const String edit = "/members/edit";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case base:
        return AuthenticatedRoute(
          builder: (context) => const MembersPage(),
          adminOnly: true,
          settings: settings,
        );
      case add:
        return AuthenticatedRoute(
          builder: (context) => const MemberAddPage(),
          adminOnly: true,
          settings: settings,
        );
      case edit:
        if (settings.arguments != null && settings.arguments is MemberModel) {
          final MemberModel member = settings.arguments as MemberModel;
          return AuthenticatedRoute(
            builder: (context) => MemberEditPage(member: member),
            adminOnly: true,
            settings: settings,
          );
        } else {
          // Handle case where the member argument is not provided or is invalid
          return MaterialPageRoute(
            builder: (context) => const NotFoundPage(),
          );
        }
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }

  // Singleton factory
  static final MembershipRoutes _instance = MembershipRoutes._internal();

  factory MembershipRoutes() {
    return _instance;
  }

  MembershipRoutes._internal();
}
