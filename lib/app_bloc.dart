import 'package:african_windows/blocs/application/bloc.dart';
import 'package:african_windows/blocs/data_table/bloc.dart';
import 'package:african_windows/apps/job/bloc/bloc.dart';
import 'package:african_windows/apps/job/bloc/event.dart';
import 'package:african_windows/blocs/theme/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final jobListingsBloc = JobListingsBloc();
  static final themeBloc = ThemeBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<JobListingsBloc>(create: (context) => jobListingsBloc..add(LoadJobsEvent())),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    jobListingsBloc.close();
    themeBloc.close();
  }
}