// job_listings_bloc.dart
import 'package:african_windows/apps/job/models/model_job.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/apps/job/data/jobs.dart';
import 'event.dart';
import 'state.dart';

class JobsBloc extends Bloc<JobListingsEvent, JobListingsState> {
  JobsBloc() : super(const JobListingsState()) {
    on<LoadJobsEvent>(_onLoadJobs);
    on<FilterJobsEvent>(_onFilterJobs);
  }

  Future<void> _onLoadJobs(LoadJobsEvent event, Emitter<JobListingsState> emit) async {
    emit(state.copyWith(status: JobListingsStatus.loading));
    try {
      final jobs = await loadJobs();
      emit(state.copyWith(
        status: JobListingsStatus.success,
        allJobs: jobs,
        filteredJobs: jobs,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: JobListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterJobs(FilterJobsEvent event, Emitter<JobListingsState> emit) {
    final filteredJobs = state.allJobs.where((job) {
      final filter = event.filter;
      bool matchesSearch = filter.query == null ||
          filter.query!.isEmpty ||
          job.title.toLowerCase().contains(filter.query!.toLowerCase()) ||
          job.type.toLowerCase().contains(filter.query!.toLowerCase()) ||
          job.country.toLowerCase().contains(filter.query!.toLowerCase()) ||
          job.field.toLowerCase().contains(filter.query!.toLowerCase());

      bool matchesField = filter.field == JobModel.defaultModel().field ||
          job.field == filter.field;

      bool matchesFunction = filter.type == JobModel.defaultModel().type ||
          job.type == filter.type;

      bool matchesCountry = filter.country == JobModel.defaultModel().country ||
          job.country == filter.country;

      return matchesSearch && matchesField && matchesFunction && matchesCountry;
    }).toList();

    emit(state.copyWith(
      filteredJobs: filteredJobs,
    ));
  }
}
