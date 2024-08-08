import 'package:african_windows/apps/user/models/model_user.dart';
import 'package:bloc/bloc.dart';
import 'package:african_windows/apps/user/data/users.dart';
import 'event.dart';
import 'state.dart';

class UsersBloc extends Bloc<UserListingsEvent, UserListingsState> {
  UsersBloc() : super(const UserListingsState()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<FilterUsersEvent>(_onFilterUsers);
    on<AddUserEvent>(_onAddUser);
    on<DeleteUserEvent>(_onDeleteUser);
    on<UpdateUserEvent>(_onUpdateUser);
  }

  Future<void> _onLoadUsers(LoadUsersEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.loading));
    try {
      final users = await loadUsers();
      emit(state.copyWith(
        status: UserListingsStatus.success,
        allUsers: users,
        filteredUsers: users,
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
          user.firstName.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.lastName.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.email!.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.phone!.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.birthday!.toLowerCase().contains(filter.query!.toLowerCase()) ||
          user.profession!.toLowerCase().contains(filter.query!.toLowerCase()) ||
          UserModel.roleToString(user.role).toLowerCase().contains(filter.query!.toLowerCase());

      bool matchesRole =
          filter.role == 'Unselected' ||
          user.role == UserModel.rolefromString(filter.role ?? '');

      return matchesSearch && matchesRole;
    }).toList();

    emit(state.copyWith(
      filteredUsers: filteredUsers,
    ));
  }

  Future<void> _onAddUser(AddUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.loading));
    try {
      final updatedUsers = List<UserModel>.from(state.allUsers)..add(event.newUser);
      emit(state.copyWith(
        status: UserListingsStatus.success,
        allUsers: updatedUsers,
        filteredUsers: updatedUsers,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteUser(DeleteUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.loading));
    try {
      final updatedUsers = state.allUsers.where((user) => user.id != event.userId).toList();
      emit(state.copyWith(
        status: UserListingsStatus.success,
        allUsers: updatedUsers,
        filteredUsers: updatedUsers,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.loading));
    try {
      final updatedUsers = state.allUsers.map((user) {
        return user.id == event.updatedUser.id ? event.updatedUser : user;
      }).toList();
      emit(state.copyWith(
        status: UserListingsStatus.success,
        allUsers: updatedUsers,
        filteredUsers: updatedUsers,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
