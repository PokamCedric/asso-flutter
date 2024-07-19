import 'package:core_dashboard/blocs/data_table/bloc.dart';
import 'package:core_dashboard/blocs/job/bloc.dart';
import 'package:core_dashboard/blocs/job/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';

class AppBloc {
  static final dataTableBloc = DataTableBloc();
  static final jobListingsBloc = JobListingsBloc();
  static final themeBloc = ThemeBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<JobListingsBloc>(create: (context) => jobListingsBloc..add(LoadJobsEvent())),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
  ];

  static void dispose() {
    dataTableBloc.close();
    jobListingsBloc.close();
    themeBloc.close();
  }
}