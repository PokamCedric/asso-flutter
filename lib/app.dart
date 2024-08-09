import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:african_windows/core/blocs/application/application_bloc.dart';
import 'package:african_windows/core/blocs/theme/theme_state.dart';
import 'package:african_windows/core/configs/theme/theme.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:african_windows/core/blocs/theme/theme_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppState();
}

class _AppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    CoreBloc.applicationsBloc.add(SetupApplicationsEvent());
  }

  @override
  void dispose() {
    CoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CoreBloc.providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<ApplicationsBloc, ApplicationsState>(
            builder: (context, appState) {
              if (appState.status == ApplicationsStatus.loading) {
                return _buildLoadingScreen();
              } else if (appState.status == ApplicationsStatus.success) {
                return _buildMainApp();
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildMainApp() {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      getPages: Routes.getPages(),
      initialRoute: Routes.initial,
    );
  }

  Widget _buildErrorScreen(String? errorMessage) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize the application: $errorMessage'),
        ),
      ),
    );
  }

  Widget _buildInitialScreen() {
    return const GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Initializing...'),
        ),
      ),
    );
  }
}
