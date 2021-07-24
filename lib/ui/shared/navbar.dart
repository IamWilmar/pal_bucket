import 'package:flutter/material.dart';
import 'package:pal_bucket/bloc/navbar/navbar_cubit.dart';
import 'package:pal_bucket/routes/router.dart';
import 'package:pal_bucket/services/navigation_service.dart';
import 'package:pal_bucket/ui/buttons/link_text.dart';
import 'package:pal_bucket/ui/buttons/nav_button.dart';
import 'package:pal_bucket/ui/labels/custom_labels.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    // if (NavbarCubit.isMenuOpen) {
    //   NavbarCubit.closeMenu();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: 50),
          Text('PalBucket', style: CustomLabels.h1),
          Spacer(),
          NavButton(
            text: 'Home',
            onPressed: () => navigateTo(Flurorouter.homeRoute),
          ),
          NavButton(
            text: 'Profile',
            onPressed: () => navigateTo(Flurorouter.profileRoute),
          ),
          NavButton(
            text: 'Friends',
            onPressed: () => navigateTo(Flurorouter.friendsRoutes),
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Color(0xFF6C3FB6),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      );
}
