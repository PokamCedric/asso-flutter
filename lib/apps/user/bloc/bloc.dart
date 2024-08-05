// user_listings_bloc.dart
import 'package:african_windows/apps/user/models/model_user.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/apps/user/data/users.dart';
import 'event.dart';
import 'state.dart';

class UserListingsBloc extends Bloc<UserListingsEvent, UserListingsState> {
  UserListingsBloc() : super(const UserListingsState()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<FilterUsersEvent>(_onFilterUsers);
  }

  Future<void> _onLoadUsers(LoadUsersEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.loading));
    try {
      final users = await loadUsers();
      emit(state.copyWith(
        status: UserListingsStatus.success,
        allUsers: users,
        filteredUsers: users,
        totalHits: users.length,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterUsers(FilterUsersEvent event, Emitter<UserListingsState> emit) {
    final filteredUsers = state.allUsers.where((user) {
      final filter = event.filter;
      bool matchesSearch =
          filter.query == null ||
          filter.query!.isEmpty ||
          user.email.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.firstName.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.lastName.toLowerCase().contains(filter.query!.toLowerCase()) ||
          UserModel.roleToString(user.role).toLowerCase().contains(filter.query!.toLowerCase());

      bool matchesRole =
          filter.role  ==  'Unselected' ||
          user.role == UserModel.rolefromString(filter.role??'') ;

      return matchesSearch && matchesRole;
    }).toList();

    emit(state.copyWith(
      filteredUsers: filteredUsers,
      totalHits: filteredUsers.length,
      currentPage: 1,
    ));
  }
}
