// state.dart
import 'package:equatable/equatable.dart';

enum ApplicationsStatus { initial, loading, success, error }

class ApplicationsState extends Equatable {
  final ApplicationsStatus status;

  final String? errorMessage;

  const ApplicationsState({
    this.status = ApplicationsStatus.initial,
    this.errorMessage,
  });

  ApplicationsState copyWith({
    ApplicationsStatus? status,
    int? totalHits,
    int? currentPage,
    String? errorMessage,
  }) {
    return ApplicationsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
