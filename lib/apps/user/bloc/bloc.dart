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
        status: UserListingsStatus.loadSuccess,
        allUsers: users,
        filteredUsers: users,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.loadError,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterUsers(FilterUsersEvent event, Emitter<UserListingsState> emit) {
    final currentState = state;
    emit(currentState.copyWith(status: UserListingsStatus.filtering));
    try {
      final filteredUsers = currentState.allUsers.where((user) {
        final filter = event.filter;
        final query = filter.query?.toLowerCase() ?? '';
        final matchesSearch = query.isEmpty ||
            user.firstName.toLowerCase().contains(query) ||
            user.lastName.toLowerCase().contains(query) ||
            user.email!.toLowerCase().contains(query) ||
            user.phone!.toLowerCase().contains(query) ||
            user.birthday!.toLowerCase().contains(query) ||
            user.profession!.toLowerCase().contains(query) ||
            UserModel.roleToString(user.role).toLowerCase().contains(query);

        final matchesRole = filter.role == 'Unselected' ||
            user.role == UserModel.rolefromString(filter.role ?? '');

        return matchesSearch && matchesRole;
      }).toList();

      emit(currentState.copyWith(
        status: UserListingsStatus.filterSuccess,
        filteredUsers: filteredUsers,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        status: UserListingsStatus.filterError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddUser(AddUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.adding));
    try {
      final currentState = state;
      if (currentState.allUsers.isNotEmpty) {
        final updatedUsers = List<UserModel>.from(currentState.allUsers)..add(event.newUser);
        emit(state.copyWith(
          status: UserListingsStatus.addSuccess,
          allUsers: updatedUsers,
          filteredUsers: updatedUsers,
        ));
      } else {
        emit(state.copyWith(
          status: UserListingsStatus.addError,
          errorMessage: 'No users loaded to add',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.addError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteUser(DeleteUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.deleting));
    try {
      final currentState = state;
      if (currentState.allUsers.isNotEmpty) {
        final updatedUsers = currentState.allUsers.where((user) => user.id != event.userId).toList();
        emit(state.copyWith(
          status: UserListingsStatus.deleteSuccess,
          allUsers: updatedUsers,
          filteredUsers: updatedUsers,
        ));
      } else {
        emit(state.copyWith(
          status: UserListingsStatus.deleteError,
          errorMessage: 'No users loaded to delete',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.deleteError,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<UserListingsState> emit) async {
    emit(state.copyWith(status: UserListingsStatus.updating));
    try {
      final currentState = state;
      if (currentState.allUsers.isNotEmpty) {
        final updatedUsers = currentState.allUsers.map((user) {
          return user.id == event.updatedUser.id ? event.updatedUser : user;
        }).toList();
        emit(state.copyWith(
          status: UserListingsStatus.updateSuccess,
          allUsers: updatedUsers,
          filteredUsers: updatedUsers,
        ));
      } else {
        emit(state.copyWith(
          status: UserListingsStatus.updateError,
          errorMessage: 'No users loaded to update',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: UserListingsStatus.updateError,
        errorMessage: e.toString(),
      ));
    }
  }
}
