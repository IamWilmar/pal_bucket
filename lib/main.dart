import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pal_bucket/api/pal_bucket_api.dart';
import 'package:pal_bucket/bloc/auth/auth_cubit.dart';
import 'package:pal_bucket/routes/router.dart';
import 'package:pal_bucket/services/local_storage.dart';
import 'package:pal_bucket/services/navigation_service.dart';
import 'package:pal_bucket/services/notifications_service.dart';
import 'package:pal_bucket/ui/labels/custom_labels.dart';
import 'package:pal_bucket/ui/layouts/auth/auth_layout.dart';

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
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PalBucket',
      theme: ThemeData(
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
        return AuthLayout(child: child!);
      },
    );
  }
}
