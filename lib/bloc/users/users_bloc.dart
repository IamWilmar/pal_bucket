import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pal_bucket/models/http/user.dart';
import 'package:pal_bucket/models/http/users_response.dart';
import 'package:pal_bucket/services/user_service.dart';
import 'package:pal_bucket/utils/bloc_utils.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final _userService = UserService();
  UsersBloc() : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is LoadUsers) {
      yield* _mapLoadUsersToState(event, state);
    }
  }

  Stream<UsersState> _mapLoadUsersToState(
    LoadUsers event,
    UsersState state,
  ) async* {
    yield UsersState(status: BlocStatus.inProgress);
    try {
      UsersResponse usersResponse = await _userService.getUsers(20);
      yield UserLoadingSuccessful(
        users: usersResponse.users,
        status: BlocStatus.submittedSuccessful,
      );
    } on Exception {
      yield UsersState(status: BlocStatus.submitedFailed);
    }
  }
}
