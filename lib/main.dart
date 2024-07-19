import 'package:core_dashboard/blocs/theme/theme_state.dart';
import 'package:core_dashboard/pages/errors/not_found.dart';
import 'package:core_dashboard/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_dashboard/app_bloc.dart';
import 'package:core_dashboard/configs/theme.dart';
import 'package:core_dashboard/shared/navigation/routes.dart';
import 'package:core_dashboard/blocs/theme/theme_bloc.dart';
import 'package:get/get.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
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
        },
      ),
    );
  }
}
