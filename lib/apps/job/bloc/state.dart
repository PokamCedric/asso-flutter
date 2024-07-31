// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/models/model_job.dart';

enum JobListingsStatus { initial, loading, success, error }

class JobListingsState extends Equatable {
  final JobListingsStatus status;
  final List<JobModel> allJobs;
  final List<JobModel> filteredJobs;
  final int totalHits;
  final int currentPage;
  final String? errorMessage;

  const JobListingsState({
    this.status = JobListingsStatus.initial,
    this.allJobs = const [],
    this.filteredJobs = const [],
    this.totalHits = 0,
    this.currentPage = 1,
    this.errorMessage,
  });

  JobListingsState copyWith({
    JobListingsStatus? status,
    List<JobModel>? allJobs,
    List<JobModel>? filteredJobs,
    int? totalHits,
    int? currentPage,
    String? errorMessage,
  }) {
    return JobListingsState(
      status: status ?? this.status,
      allJobs: allJobs ?? this.allJobs,
      filteredJobs: filteredJobs ?? this.filteredJobs,
      totalHits: totalHits ?? this.totalHits,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allJobs, filteredJobs, totalHits, currentPage, errorMessage];
}
