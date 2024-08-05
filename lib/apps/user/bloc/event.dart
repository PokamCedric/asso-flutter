import 'package:african_windows/apps/user/models_views/model_filter.dart';
import 'package:equatable/equatable.dart';

abstract class UserListingsEvent extends Equatable {
  const UserListingsEvent();

  @override
  List<Object> get props => [];
}

class LoadUsersEvent extends UserListingsEvent {}

class FilterUsersEvent extends UserListingsEvent {
  final FilterModel filter;

  const FilterUsersEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
