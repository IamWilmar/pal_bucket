part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final String? token;
  final AuthStatus authStatus;
  AuthInitial({this.token, this.authStatus = AuthStatus.checking});
}
