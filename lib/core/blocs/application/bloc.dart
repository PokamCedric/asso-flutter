// application_bloc.dart
import 'package:african_windows/core/blocs/theme/theme_event.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/configs/theme/theme.dart';
import 'package:african_windows/core/utils/local_storage/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event.dart';
import 'state.dart';

class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  ApplicationsBloc() : super(const ApplicationsState()) {
    on<SetupApplicationsEvent>(_onSetupApplication);
  }

  Future<void> _onSetupApplication(SetupApplicationsEvent event, Emitter<ApplicationsState> emit) async {
    emit(state.copyWith(status: ApplicationsStatus.loading));
    try {

    AppConfig.preferences = await SharedPreferences.getInstance();

    AppConfig.secureStorage = const FlutterSecureStorage();


    AppTheme.darkThemeOption = await LocalStorage.getDarkOption();

    CoreBloc.themeBloc.add(OnChangeTheme(darkOption: AppTheme.darkThemeOption));

    emit(state.copyWith(status: ApplicationsStatus.success));

    } catch (e) {
      emit(state.copyWith(
        status: ApplicationsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

}
