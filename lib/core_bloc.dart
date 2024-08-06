import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/user/bloc/user_bloc.dart';
import 'package:african_windows/core/blocs/application/bloc.dart';
import 'package:african_windows/core/blocs/datatable/bloc.dart';
import 'package:african_windows/core/blocs/theme/bloc.dart';


class CoreBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final jobListingsBloc = JobListingsBloc();
  static final themeBloc = ThemeBloc();
  static final userListingsBloc = UserListingsBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<JobListingsBloc>(create: (context) => jobListingsBloc..add(LoadJobsEvent())),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
    BlocProvider<UserListingsBloc>(create: (context) => userListingsBloc..add(LoadUsersEvent())),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    jobListingsBloc.close();
    themeBloc.close();
    userListingsBloc.close();
  }
}