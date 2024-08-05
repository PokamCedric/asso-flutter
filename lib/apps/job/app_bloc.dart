import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class JobsAppBloc {
  static final jobListingsBloc = JobListingsBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<JobListingsBloc>(create: (context) => jobListingsBloc..add(LoadJobsEvent())),
  ];

  static void dispose() {
    jobListingsBloc.close();
  }
}