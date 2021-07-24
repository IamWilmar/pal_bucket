import 'package:fluro/fluro.dart';
import 'package:pal_bucket/bloc/auth/auth_cubit.dart';
import 'package:pal_bucket/ui/layouts/splash/splash_layout.dart';
import 'package:pal_bucket/ui/views/app/home_view.dart';
import 'package:pal_bucket/ui/views/auth/login_view.dart';
import 'package:pal_bucket/ui/views/auth/register_view.dart';
import 'package:pal_bucket/utils/auth_status.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler loginHandler = new Handler(
    handlerFunc: (context, parameters) {
      final authCubit = Provider.of<AuthCubit>(context!);
      if (authCubit.authStatus == AuthStatus.notAuthenticated)
        return LoginView();
      else if (authCubit.authStatus == AuthStatus.authenticated)
        return HomeView();
      else
        return SplashLayout();
    },
  );

  static Handler registerHandler = new Handler(
    handlerFunc: (context, parameters) {
      final authCubit = Provider.of<AuthCubit>(context!);
      if (authCubit.authStatus == AuthStatus.notAuthenticated)
        return RegisterView();
      else
        return HomeView();
    },
  );
}
