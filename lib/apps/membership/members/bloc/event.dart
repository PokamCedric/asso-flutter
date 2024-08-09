import 'package:african_windows/apps/membership/members/models_views/model_filter.dart';
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/membership/members/models/model_user.dart';

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

class AddUserEvent extends UserListingsEvent {
  final UserModel newUser;

  const AddUserEvent(this.newUser);

  @override
  List<Object> get props => [newUser];
}

class DeleteUserEvent extends UserListingsEvent {
  final String userId;

  const DeleteUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class UpdateUserEvent extends UserListingsEvent {
  final UserModel updatedUser;

  const UpdateUserEvent(this.updatedUser);

  @override
  List<Object> get props => [updatedUser];
}
