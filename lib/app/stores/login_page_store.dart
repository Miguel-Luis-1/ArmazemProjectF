import 'dart:convert';
import 'dart:developer';

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
  login(){
    Map<String, dynamic> data = {
      'email': emailController.text,
      'password': senhaController.text,
    };
    dynamic user = jsonEncode(data);
    log(user.toString(), name: 'User');
  }

  @action
  dispose(){
    emailController.clear();
    senhaController.clear();
  }
}
