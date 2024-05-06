import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/service/user_service.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
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
  @observable
  TextEditingController isGerente = TextEditingController();

  @action
  cadastro(context) async {
    Map<String, dynamic> data = {
      'name': nomeController.text,
      'email': emailController.text,
      'password': senhaController.text,
      'empresa_id': codigoEmpresaController.text,
      'is_gerente': isGerente.text,
    };
    UserService().cadastro(data).whenComplete(() {
      Asuka.showDialog(
        builder: (BuildContext dialogcontext) {
          return DialogBase(
            title: 'Usuário cadastrado',
            content: const Text(
              'Usuário cadastrado com sucesso!',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(dialogcontext);
                },
              ),
            ],
          );
        },
      );
    });
    dynamic user = jsonEncode(data);
    log(user.toString(), name: 'User');
  }

  @action
  dispose() {
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
    codigoEmpresaController.clear();
  }
}
