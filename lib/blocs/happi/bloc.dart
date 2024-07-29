import 'package:bloc/bloc.dart';
import 'package:african_windows/data/data_happi.dart';
import 'event.dart';
import 'state.dart';

class HappiListingsBloc extends Bloc<HappiListingsEvent, HappiListingsState> {
  HappiListingsBloc() : super(const HappiListingsState()) {
    on<LoadHappiEvent>(_onLoadHappi);
    on<FilterHappiEvent>(_onFilterHappi);
  }

  Future<void> _onLoadHappi(
      LoadHappiEvent event, Emitter<HappiListingsState> emit) async {
    emit(state.copyWith(status: HappiListingsStatus.loading));
    try {
      final happiList = await loadHappi();
      emit(state.copyWith(
        status: HappiListingsStatus.success,
        allHappi: happiList,
        filteredHappi: happiList,
        totalHits: happiList.length,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HappiListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterHappi(
      FilterHappiEvent event, Emitter<HappiListingsState> emit) {
    final filteredHappi = state.allHappi.where((happi) {
      final filter = event.filter;
      bool matchesSearch = filter.query == null ||
          filter.query!.isEmpty ||
          happi.title.toLowerCase().contains(filter.query!.toLowerCase()) ||
          happi.type.toLowerCase().contains(filter.query!.toLowerCase()) ||
          happi.country.toLowerCase().contains(filter.query!.toLowerCase()) ||
          happi.field.toLowerCase().contains(filter.query!.toLowerCase());

      bool matchesField =
          filter.field == 'All Fields' || happi.field == filter.field;

      bool matchesFunction =
          filter.type == 'All types of function' || happi.type == filter.type;

      bool matchesCountry =
          filter.country == 'All countries' || happi.country == filter.country;

      return matchesSearch && matchesField && matchesFunction && matchesCountry;
    }).toList();

    emit(state.copyWith(
      filteredHappi: filteredHappi,
      totalHits: filteredHappi.length,
      currentPage: 1,
    ));
  }
}
