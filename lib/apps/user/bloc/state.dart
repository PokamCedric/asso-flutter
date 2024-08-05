// state.dart
import 'package:equatable/equatable.dart';
import 'package:african_windows/apps/user/models/model_user.dart';

enum UserListingsStatus { initial, loading, success, error }

class UserListingsState extends Equatable {
  final UserListingsStatus status;
  final List<UserModel> allUsers;
  final List<UserModel> filteredUsers;
  final int totalHits;
  final int currentPage;
  final String? errorMessage;

  const UserListingsState({
    this.status = UserListingsStatus.initial,
    this.allUsers = const [],
    this.filteredUsers = const [],
    this.totalHits = 0,
    this.currentPage = 1,
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
      totalHits: totalHits ?? this.totalHits,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allUsers, filteredUsers, totalHits, currentPage, errorMessage];
}
