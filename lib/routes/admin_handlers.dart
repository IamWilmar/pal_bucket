import 'package:fluro/fluro.dart';
import 'package:pal_bucket/ui/views/auth/login_view.dart';
import 'package:pal_bucket/ui/views/auth/register_view.dart';

class AdminHandlers {
  static Handler loginHandler = new Handler(
    handlerFunc: (context, parameters) {
      return LoginView();
    },
  );

  static Handler registerHandler = new Handler(
    handlerFunc: (context, parameters) {
      return RegisterView();
    },
  );
}
