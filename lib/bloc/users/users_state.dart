part of 'users_bloc.dart';

class UsersState extends Equatable {
  final BlocStatus status;
  final List<User> users;
  const UsersState({
    this.status = BlocStatus.noSubmitted,
    this.users = const [],
  });

  @override
  List<Object> get props => [status, users];
}

class UsersInitial extends UsersState {}

class UserLoadingSuccessful extends UsersState {
  final List<User> users;
  final BlocStatus status;

  UserLoadingSuccessful({
    required this.users,
    required this.status,
  });

  UserLoadingSuccessful copyWith({
    List<User>? users,
    BlocStatus? status,
  }) =>
      UserLoadingSuccessful(
        users: users ?? this.users,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status, users];
}
