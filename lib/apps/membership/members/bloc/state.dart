// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/membership/members/models/model_user.dart';

enum UsersStatus {
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

class UsersState extends Equatable {
  final UsersStatus status;
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;
  final String? errorMessage;

  const UsersState({
    this.status = UsersStatus.initial,
    this.allUsers = const [],
    this.filteredUsers = const [],
    this.errorMessage,
  });

  UsersState copyWith({
    UsersStatus? status,
    List<UserModel>? allUsers,
    List<UserModel>? filteredUsers,
    int? totalHits,
    int? currentPage,
    String? errorMessage,
  }) {
    return UsersState(
      status: status ?? this.status,
      allUsers: allUsers ?? this.allUsers,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allUsers, filteredUsers, errorMessage];
}
