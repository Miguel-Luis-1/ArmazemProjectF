import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_page_store.g.dart';

class LoginPageStore = LoginPageStoreBase with _$LoginPageStore;

abstract class LoginPageStoreBase with Store {
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();

  @action
  login(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences;
      sharedPreferences = await SharedPreferences.getInstance();
      Map<String, dynamic> data = {
        'email': emailController.text,
        'password': senhaController.text,
      };
      UserService().login(data).then((value) async {
        log(value.toString());
        await sharedPreferences.setString('token', value.toString());
        Navigator.pop(context);
      });
    } catch (e) {
      log('Ocorreu um erro: $e');
    }
  }

  @action
  dispose() {
    emailController.clear();
    senhaController.clear();
  }
}
