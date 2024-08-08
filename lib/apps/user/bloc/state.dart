import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/user/models/model_user.dart';

enum UserListingsStatus { initial, loading, success, error }

// Base State
abstract class UserListingsState extends Equatable {
  const UserListingsState();

  @override
  List<Object?> get props => [];
}

// States for Loading Users
class UserLoadingState extends UserListingsState {}

class UserLoadedState extends UserListingsState {
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;

  const UserLoadedState({
    required this.allUsers,
    required this.filteredUsers,
  });

  @override
  List<Object?> get props => [allUsers, filteredUsers];
}

// States for Adding a User
class UserAddingState extends UserListingsState {}

class UserAddedState extends UserListingsState {
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;

  const UserAddedState({
    required this.allUsers,
    required this.filteredUsers,
  });

  @override
  List<Object?> get props => [allUsers, filteredUsers];
}

// States for Deleting a User
class UserDeletingState extends UserListingsState {}

class UserDeletedState extends UserListingsState {
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;

  const UserDeletedState({
    required this.allUsers,
    required this.filteredUsers,
  });

  @override
  List<Object?> get props => [allUsers, filteredUsers];
}

// States for Updating a User
class UserUpdatingState extends UserListingsState {}

class UserUpdatedState extends UserListingsState {
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;

  const UserUpdatedState({
    required this.allUsers,
    required this.filteredUsers,
  });

  @override
  List<Object?> get props => [allUsers, filteredUsers];
}

// State for Handling Errors
class UserErrorState extends UserListingsState {
  final String errorMessage;

  const UserErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
