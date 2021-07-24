import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<String> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String email = '';
  String password = '';
  LoginCubit() : super('');

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
