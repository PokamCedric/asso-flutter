// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/user/models/model_user.dart';

enum UserListingsStatus {
  initial,
  loading,
  filtering,
  adding,
  deleting,
  updating,

  // Success States
  loadSuccess,
  filterSuccess,
  addSuccess,
  deleteSuccess,
  updateSuccess,

  // Error States
  loadError,
  filterError,
  addError,
  deleteError,
  updateError,
}

class UserListingsState extends Equatable {
  final UserListingsStatus status;
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;
  final String? errorMessage;

  const UserListingsState({
    this.status = UserListingsStatus.initial,
    this.allUsers = const [],
    this.filteredUsers = const [],
    this.errorMessage,
  });

  UserListingsState copyWith({
    UserListingsStatus? status,
    List<UserModel>? allUsers,
    List<UserModel>? filteredUsers,
    int? totalHits,
    int? currentPage,
    String? errorMessage,
  }) {
    return UserListingsState(
      status: status ?? this.status,
      allUsers: allUsers ?? this.allUsers,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allUsers, filteredUsers, errorMessage];
}
