import 'package:african_windows/core/blocs/application/bloc.dart';
import 'package:african_windows/core/blocs/datatable/bloc.dart';
import 'package:african_windows/core/blocs/theme/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoreBloc {
  static final applicationsBloc = ApplicationsBloc();
  static final dataTableBloc = DataTableBloc();
  static final themeBloc = ThemeBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationsBloc>(create: (context) => applicationsBloc),
    BlocProvider<DataTableBloc>(create: (context) => dataTableBloc),
    BlocProvider<ThemeBloc>(create: (context) => themeBloc),
  ];

  static void dispose() {
    applicationsBloc.close();
    dataTableBloc.close();
    themeBloc.close();
  }
}