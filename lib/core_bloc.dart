import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/user/bloc/user_bloc.dart';
import 'package:african_windows/core/blocs/application/bloc.dart';
import 'package:african_windows/core/blocs/datatable/bloc.dart';
import 'package:african_windows/core/blocs/theme/bloc.dart';


class CoreBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final jobsBloc = JobsBloc();
  static final themeBloc = ThemeBloc();
  static final usersBloc = UsersBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<JobsBloc>(create: (context) => jobsBloc..add(LoadJobsEvent())),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
    BlocProvider<UsersBloc>(create: (context) => usersBloc..add(LoadUsersEvent())),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    jobsBloc.close();
    themeBloc.close();
    usersBloc.close();
  }
}