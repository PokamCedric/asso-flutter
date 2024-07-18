import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';

class AppBloc {
  static final themeBloc = ThemeBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ThemeBloc>(create: (context) => themeBloc)
  ];

  static void dispose() {
    themeBloc.close();
  }
}