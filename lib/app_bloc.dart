import 'package:african_windows/blocs/application/bloc.dart';
import 'package:african_windows/blocs/data_table/bloc.dart';
import 'package:african_windows/blocs/happi/bloc.dart'; // Importez le bloc Happi
import 'package:african_windows/blocs/happi/event.dart'; // Importez les événements Happi
import 'package:african_windows/blocs/job/bloc.dart';
import 'package:african_windows/blocs/job/event.dart';
import 'package:african_windows/blocs/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final jobListingsBloc = JobListingsBloc();
  static final happiListingsBloc = HappiListingsBloc(); // Ajoutez le bloc Happi
  static final themeBloc = ThemeBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<JobListingsBloc>(
        create: (context) => jobListingsBloc..add(loadJobsEvent())),
    BlocProvider<HappiListingsBloc>(
        create: (context) => happiListingsBloc
          ..add(LoadHappiEvent())), // Ajoutez le provider Happi
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    jobListingsBloc.close();
    happiListingsBloc.close(); // Assurez-vous de fermer le bloc Happi
    themeBloc.close();
  }
}
