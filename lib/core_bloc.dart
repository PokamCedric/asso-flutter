import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:african_windows/apps/membership/members/bloc/member_bloc.dart';
import 'package:african_windows/core/blocs/application/bloc.dart';
import 'package:african_windows/core/blocs/datatable/bloc.dart';
import 'package:african_windows/core/blocs/theme/bloc.dart';


class CoreBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final themeBloc = ThemeBloc();
  static final membersBloc = MembersBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
    BlocProvider<MembersBloc>(create: (context) => membersBloc..add(LoadMembersEvent())),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    themeBloc.close();
    membersBloc.close();
  }
}