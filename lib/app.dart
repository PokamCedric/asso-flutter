// app.dart
import 'package:african_windows/core/controllers/provider_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/core/blocs/application/application_bloc.dart';
import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/blocs/theme/theme_state.dart';
import 'package:african_windows/app_bloc.dart';
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
    final route = Routes();
    final navigationController = NavigationController();

    return MultiProvider(
      providers: [
        Provider<NavigationController>.value(value: navigationController),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        navigatorKey: navigationController.navigatorKey,
        initialRoute: Routes.initial,
        onGenerateRoute: route.generateRoute,
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
