import 'package:african_windows/models/model_filter.dart';
import 'package:equatable/equatable.dart';

abstract class JobListingsEvent extends Equatable {
  const JobListingsEvent();

  @override
  List<Object> get props => [];
}

class LoadJobsEvent extends JobListingsEvent {}

class FilterJobsEvent extends JobListingsEvent {
  final FilterModel filter;

  const FilterJobsEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
