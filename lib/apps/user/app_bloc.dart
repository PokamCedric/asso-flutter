import 'package:african_windows/apps/user/bloc/bloc.dart';
import 'package:african_windows/apps/user/bloc/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersAppBloc {
  static final userListingsBloc = UserListingsBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<UserListingsBloc>(create: (context) => userListingsBloc..add(LoadUsersEvent())),
  ];

  static void dispose() {
    userListingsBloc.close();
  }
}