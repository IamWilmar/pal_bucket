import 'package:fluro/fluro.dart';
import 'package:pal_bucket/routes/admin_handlers.dart';
import 'package:pal_bucket/routes/home_handlers.dart';
import 'package:pal_bucket/routes/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  //Auth Paths
  static String rootRoute = '/';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //App Paths
  static String homeRoute = '/home';
  static String profileRoute = '/home/profile';
  static String friendsRoutes = '/home/friends';
  static String userRoute = '/home/user/:uid';

  static void configureRoutes() {
    //Auth Routes
    router.define(
      rootRoute,
      handler: AdminHandlers.loginHandler,
      transitionType: TransitionType.none,
    );

    router.define(
      loginRoute,
      handler: AdminHandlers.loginHandler,
      transitionType: TransitionType.none,
    );

    router.define(
      registerRoute,
      handler: AdminHandlers.registerHandler,
      transitionType: TransitionType.none,
    );

    //Home Routes
    router.define(
      homeRoute,
      handler: HomeHandlers.homeHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      profileRoute,
      handler: HomeHandlers.profileHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      friendsRoutes,
      handler: HomeHandlers.friendsHandler,
      transitionType: TransitionType.fadeIn,
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
