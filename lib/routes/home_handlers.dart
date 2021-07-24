import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class HomeHandlers {
  static Handler homeHandler = new Handler(
    handlerFunc: (context, parameters) {
      return Container(
        child: Text('Home'),
      );
    },
  );
}
