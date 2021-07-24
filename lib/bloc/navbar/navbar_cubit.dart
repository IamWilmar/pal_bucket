import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  static late AnimationController menuController;
  static bool isMenuOpen = false;
  NavbarCubit() : super(NavbarInitial());

  static Animation<double> movement = Tween(begin: -200.0, end: 0.0).animate(
    CurvedAnimation(parent: menuController, curve: Curves.easeInOut),
  );
  static Animation<double> opacity = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: menuController, curve: Curves.easeInOut),
  );

  void setCurrentPageUrl(String routeName) {
    Future.delayed(Duration(milliseconds: 100), () {
      emit(NavbarInitial(currentPage: routeName));
    });
  }

  static void openMenu() {
    isMenuOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isMenuOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isMenuOpen) ? menuController.reverse() : menuController.forward();
    isMenuOpen = !isMenuOpen;
  }
}
