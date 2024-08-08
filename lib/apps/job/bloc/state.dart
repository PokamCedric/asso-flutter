// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/job/models/model_job.dart';

enum JobListingsStatus { initial, loading, success, error }

class JobListingsState extends Equatable {
  final JobListingsStatus status;
  final List<JobModel> allJobs;
  final List<JobModel> filteredJobs;
  final String? errorMessage;

  const JobListingsState({
    this.status = JobListingsStatus.initial,
    this.allJobs = const [],
    this.filteredJobs = const [],
    this.errorMessage,
  });

  JobListingsState copyWith({
    JobListingsStatus? status,
    List<JobModel>? allJobs,
    List<JobModel>? filteredJobs,
    String? errorMessage,
  }) {
    return JobListingsState(
      status: status ?? this.status,
      allJobs: allJobs ?? this.allJobs,
      filteredJobs: filteredJobs ?? this.filteredJobs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allJobs, filteredJobs, errorMessage];
}
