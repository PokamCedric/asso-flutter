import 'package:core_dashboard/models/model_job.dart';
import 'package:equatable/equatable.dart';

class JobListingsState extends Equatable {
  final List<JobModel> allJobs;
  final List<JobModel> filteredJobs;
  final int totalHits;

  const JobListingsState({
    this.allJobs = const [],
    this.filteredJobs = const [],
    this.totalHits = 0,
  });

  JobListingsState copyWith({
    List<JobModel>? allJobs,
    List<JobModel>? filteredJobs,
    int? rowsPerPage,
    int? currentPage,
    int? totalHits,
  }) {
    return JobListingsState(
      allJobs: allJobs ?? this.allJobs,
      filteredJobs: filteredJobs ?? this.filteredJobs,
      totalHits: totalHits ?? this.totalHits,
    );
  }

  @override
  List<Object> get props => [allJobs, filteredJobs, totalHits];
}
