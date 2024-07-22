// application_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:core_dashboard/app_bloc.dart';
import 'package:core_dashboard/blocs/bloc.dart';
import 'package:core_dashboard/configs/application.dart';
import 'package:core_dashboard/configs/theme.dart';
import 'package:core_dashboard/utils/local_storage.dart';
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

    ///Setup SharedPreferences
    Application.preferences = await SharedPreferences.getInstance();


    AppTheme.darkThemeOption = await LocalStorage.getDarkOption();

    AppBloc.themeBloc.add(OnChangeTheme(darkOption: AppTheme.darkThemeOption));

    emit(state.copyWith(status: ApplicationsStatus.success));

    } catch (e) {
      emit(state.copyWith(
        status: ApplicationsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

}