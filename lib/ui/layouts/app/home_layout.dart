import 'package:flutter/material.dart';
import 'package:pal_bucket/ui/shared/navbar.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
