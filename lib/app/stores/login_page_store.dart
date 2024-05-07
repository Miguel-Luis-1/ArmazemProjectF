import 'dart:developer';

import 'package:armazemf/app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
      Map<String, dynamic> data = {
        'email': emailController.text,
        'password': senhaController.text,
      };
      return await UserService().login(data, context).whenComplete(() async {
        dispose();
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
