import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pal_bucket/bloc/auth/auth_cubit.dart';
import 'package:pal_bucket/bloc/navbar/navbar_cubit.dart';
import 'package:pal_bucket/bloc/users/users_bloc.dart';
import 'package:pal_bucket/routes/router.dart';
import 'package:pal_bucket/ui/views/app/friends_view.dart';
import 'package:pal_bucket/ui/views/app/home_view.dart';
import 'package:pal_bucket/ui/views/app/profile_view.dart';
import 'package:pal_bucket/ui/views/auth/login_view.dart';
import 'package:pal_bucket/utils/auth_status.dart';
import 'package:provider/provider.dart';

class HomeHandlers {
  static Handler homeHandler = new Handler(
    handlerFunc: (context, parameters) {
      final authCubit = Provider.of<AuthCubit>(context!);
      BlocProvider.of<NavbarCubit>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.homeRoute);
      if (authCubit.authStatus == AuthStatus.authenticated) {
        BlocProvider.of<UsersBloc>(context, listen: false).add(
          LoadUsers(),
        );
        return HomeView();
      } else {
        print("not authenticated");
        return LoginView();
      }
    },
  );

  static Handler profileHandler = new Handler(
    handlerFunc: (context, parameters) {
      final authCubit = Provider.of<AuthCubit>(context!);
      BlocProvider.of<NavbarCubit>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.profileRoute);
      if (authCubit.authStatus == AuthStatus.authenticated) {
        print('I am Authenticated');
        return ProfileView();
      } else {
        print("not authenticated");
        return LoginView();
      }
    },
  );

  static Handler friendsHandler = new Handler(
    handlerFunc: (context, parameters) {
      final authCubit = Provider.of<AuthCubit>(context!);
      BlocProvider.of<NavbarCubit>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.friendsRoutes);
      if (authCubit.authStatus == AuthStatus.authenticated) {
        print('I am Authenticated');
        return FriendsView();
      } else {
        print("not authenticated");
        return LoginView();
      }
    },
  );
}
