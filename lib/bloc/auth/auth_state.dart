part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {
  final String? token;
  AuthStatus authStatus;
  AuthInitial({this.token, this.authStatus = AuthStatus.checking}) {
    this.isAuthenticated(); //THis is the reason why the login inmediately go to the homepage :)
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      return false;
    }
    await Future.delayed(Duration(milliseconds: 3));
    authStatus = AuthStatus.authenticated;
    return true;
  }
}
