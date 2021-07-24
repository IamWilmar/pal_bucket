import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pal_bucket/api/pal_bucket_api.dart';
import 'package:pal_bucket/models/http/auth_response.dart';
import 'package:pal_bucket/routes/router.dart';
import 'package:pal_bucket/services/local_storage.dart';
import 'package:pal_bucket/services/navigation_service.dart';
import 'package:pal_bucket/services/notifications_service.dart';
import 'package:pal_bucket/utils/auth_status.dart';
import 'package:pal_bucket/models/http/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;
  AuthCubit() : super(AuthInitial());

  login(String email, String password) {
    final data = {
      'email': email,
      'password': password,
    };
    PalBucketApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      LocalStorage.prefs.setString('token', authResponse.token);
      PalBucketApi.configureDio();
      isAuthenticated();
      NavigationService.replaceTo(Flurorouter.homeRoute);
    }).catchError((e) {
      NotificationService.showSnackbarError('No se puedo registrar');
    });
  }

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };
    PalBucketApi.httpPost('/auth/register', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.user;
      LocalStorage.prefs.setString('token', authResponse.token);
      PalBucketApi.configureDio();
      isAuthenticated();
      NavigationService.replaceTo(Flurorouter.homeRoute);
    }).catchError((e) {
      print('error en $e');
      NotificationService.showSnackbarError('No se puedo registrar');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      emit(new AuthInitial(
          token: token, authStatus: AuthStatus.notAuthenticated));
      return false;
    }
    try {
      final resp = await PalBucketApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      this.user = authResponse.user;
      authStatus = AuthStatus.authenticated;
      emit(new AuthInitial(
        authStatus: AuthStatus.authenticated,
      ));
      return true;
    } catch (err) {
      authStatus = AuthStatus.notAuthenticated;
      emit(new AuthInitial(
        authStatus: AuthStatus.notAuthenticated,
      ));
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    emit(new AuthInitial(
      authStatus: AuthStatus.notAuthenticated,
    ));
  }
}
