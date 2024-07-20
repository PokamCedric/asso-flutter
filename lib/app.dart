// main.dart
import 'package:core_dashboard/blocs/application/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_dashboard/blocs/theme/theme_state.dart';
import 'package:core_dashboard/pages/errors/not_found.dart';
import 'package:core_dashboard/app_bloc.dart';
import 'package:core_dashboard/configs/theme.dart';
import 'package:core_dashboard/shared/navigation/routes.dart';
import 'package:core_dashboard/blocs/theme/theme_bloc.dart';
import 'package:get/get.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppState();
}

class _AppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    AppBloc.applicationsBloc.add(SetupApplicationsEvent());
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<ApplicationsBloc, ApplicationsState>(
            builder: (context, appState) {
              if (appState.status == ApplicationsStatus.loading) {
                return _buildLoadingScreen();
              } else if (appState.status == ApplicationsStatus.success) {
                return _buildMainApp(themeState);
              } else if (appState.status == ApplicationsStatus.error) {
                return _buildErrorScreen(appState.errorMessage);
              } else {
                return _buildInitialScreen();
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildMainApp(ThemeState themeState) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: getPageRoute(),
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const NotFoundPage(),
      ),
    );
  }

  Widget _buildErrorScreen(String? errorMessage) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize the application: $errorMessage'),
        ),
      ),
    );
  }

  Widget _buildInitialScreen() {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Initializing...'),
        ),
      ),
    );
  }
}
