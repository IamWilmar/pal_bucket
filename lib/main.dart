import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pal_bucket/api/pal_bucket_api.dart';
import 'package:pal_bucket/bloc/auth/auth_cubit.dart';
import 'package:pal_bucket/bloc/navbar/navbar_cubit.dart';
import 'package:pal_bucket/routes/router.dart';
import 'package:pal_bucket/services/local_storage.dart';
import 'package:pal_bucket/services/navigation_service.dart';
import 'package:pal_bucket/services/notifications_service.dart';
import 'package:pal_bucket/ui/labels/custom_labels.dart';
import 'package:pal_bucket/ui/layouts/app/home_layout.dart';
import 'package:pal_bucket/ui/layouts/auth/auth_layout.dart';
import 'package:pal_bucket/ui/layouts/splash/splash_layout.dart';
import 'package:pal_bucket/utils/auth_status.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  PalBucketApi.configureDio();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (_) => AuthCubit()),
        BlocProvider(lazy: false, create: (_) => NavbarCubit()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.isAuthenticated();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PalBucket',
            theme: ThemeData(
              primaryColor: Color(0xFF6C3FB6),
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF6C3FB6),
                textTheme: TextTheme(headline6: CustomLabels.h1),
              ),
            ),
            initialRoute: '/',
            onGenerateRoute: Flurorouter.router.generator,
            navigatorKey: NavigationService.navigatorKey,
            scaffoldMessengerKey: NotificationService.messengerKey,
            builder: (context, child) {
              //AuthLayout;
              if (state.authStatus == AuthStatus.checking)
                return SplashLayout();

              if (state.authStatus == AuthStatus.authenticated) {
                print("====Main authenticated=====");
                return HomeLayout(child: child ?? Container());
              } else {
                print("====Main NOT authenticated=====");
                return AuthLayout(child: child ?? Container());
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
