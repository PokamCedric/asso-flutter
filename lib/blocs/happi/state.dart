import 'package:african_windows/models/model_happi.dart';
import 'package:equatable/equatable.dart';

enum HappiListingsStatus { initial, loading, success, error }

class HappiListingsState extends Equatable {
  final HappiListingsStatus status;
  final List<HappiModel> allHappi;
  final List<HappiModel> filteredHappi;
  final int totalHits;
  final String errorMessage;
  final int currentPage;

  const HappiListingsState({
    this.status = HappiListingsStatus.initial,
    this.allHappi = const [],
    this.filteredHappi = const [],
    this.totalHits = 0,
    this.errorMessage = '',
    this.currentPage = 1,
  });

  HappiListingsState copyWith({
    HappiListingsStatus? status,
    List<HappiModel>? allHappi,
    List<HappiModel>? filteredHappi,
    int? totalHits,
    String? errorMessage,
    int? currentPage,
  }) {
    return HappiListingsState(
      status: status ?? this.status,
      allHappi: allHappi ?? this.allHappi,
      filteredHappi: filteredHappi ?? this.filteredHappi,
      totalHits: totalHits ?? this.totalHits,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        allHappi,
        filteredHappi,
        totalHits,
        errorMessage,
        currentPage,
      ];
}
