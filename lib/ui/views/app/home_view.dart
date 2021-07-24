import 'package:flutter/material.dart';
import 'package:pal_bucket/ui/list/user_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFFEFEDF0),
      child: (size.width > 1000) ? DesktopHomeBody() : MobileHomeBody(),
    );
  }
}

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: UserList(),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFEFEDF0),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileHomeBody extends StatelessWidget {
  const MobileHomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
