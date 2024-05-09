import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/models/item.dart';
import 'package:armazemf/app/models/user.dart';
import 'package:armazemf/app/service/itens_service.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_edit_page_store.g.dart';

class CreateEditPageStore = CreateEditPageStoreBase with _$CreateEditPageStore;

abstract class CreateEditPageStoreBase with Store {
  @observable
  ObservableList itens = ObservableList();
  @observable
  Item? item;
  @observable
  String? titlePage;
  @observable
  TextEditingController codigoController = TextEditingController();
  @observable
  TextEditingController nomeController = TextEditingController();
  @observable
  TextEditingController descricaoController = TextEditingController();
  @observable
  TextEditingController categoriaController = TextEditingController();
  @observable
  TextEditingController precoController = TextEditingController();
  @observable
  TextEditingController qtdunitariaController = TextEditingController();
  @observable
  User? user;

  @action
  getIten(String? id) {
    if (id != '') {
      log(id!);
      titlePage = 'Editar produto';     
    } else {
      titlePage = 'Criar Produtos';
    }
  }

  @action
  create(BuildContext context) async {
    Map<String, dynamic> data = {
      'codigo': codigoController.text,
      'nome': nomeController.text,
      'categoria': categoriaController.text,
      'descricao': descricaoController.text,
      'preco':  double.tryParse(precoController.text),
      'qtdunitaria': qtdunitariaController.text,
    };
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? dados = sharedPreferences.getString('user');
    if (dados == null) {
      log('Deslogado');
    } else {
      log(dados);
      Map<String, dynamic> userMap = jsonDecode(dados);
      user = User(
        id: userMap['id'],
        nome: userMap['name'],
        email: userMap['email'],
      );
    }
    log(data.toString());
    await ItensService().creteIten(data, user!.id.toString()).whenComplete(() {
      Asuka.showDialog(
        builder: (BuildContext dialogcontext) {
          return DialogBase(
            title: 'Suceeso!',
            content: const Text(
              'Item criado com suceeso!',
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
                  Navigator.pop(dialogcontext);
                  Modular.to.pushNamed('/');
                },
              ),
            ],
          );
        },
      );
    });
  }

  @action
  dispose() {
    itens.clear();
    codigoController.clear();
    nomeController.clear();
    categoriaController.clear();
    descricaoController.clear();
    precoController.clear();
    qtdunitariaController.clear();
  }
}
