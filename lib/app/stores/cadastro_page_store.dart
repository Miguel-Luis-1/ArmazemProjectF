import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_page_store.g.dart';

class CadastroPageStore = CadastroPageStoreBase with _$CadastroPageStore;

abstract class CadastroPageStoreBase with Store {
  @observable
  TextEditingController nomeController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();
  @observable
  TextEditingController codigoEmpresaController = TextEditingController();


  @action
  cadastro(){
    Map<String, dynamic> data = {
      'name' : nomeController.text,
      'email': emailController.text,
      'password': senhaController.text,
      'empresa_id': codigoEmpresaController.text,
    };
    dynamic user = jsonEncode(data);
    log(user.toString(), name: 'User');
  }

  @action
  dispose(){
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
    codigoEmpresaController.clear();
  }
}
