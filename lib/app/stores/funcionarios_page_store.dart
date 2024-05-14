import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/models/user.dart';
import 'package:armazemf/app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'funcionarios_page_store.g.dart';

class FuncionariosPageStore = FuncionariosPageStoreBase
    with _$FuncionariosPageStore;

abstract class FuncionariosPageStoreBase with Store {
  @observable
  ObservableList funcionarios = ObservableList();
  @observable
  bool diaogIsOpen = false;
  @observable
  User? user;
  @observable
  late Map<String, dynamic> funcionario;
  @observable
  bool isLoading = false;

  @action
  setIsLoading() {
    isLoading = !isLoading;
    log(isLoading.toString());
  }

  @action
  setDialogState() {
    diaogIsOpen = !diaogIsOpen;
  }

  @action
  getFuncionarios(BuildContext context) async {
    setIsLoading();
    dispose();
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? dados = sharedPreferences.getString('user');
    if (dados == null) {
      log('Deslogado');
    } else {
      Map<String, dynamic> userMap = jsonDecode(dados);
      user = User(
        id: userMap['id'],
        nome: userMap['name'],
        email: userMap['email'],
        empresaId: userMap['empresa_id'].toString(),
        isGerente: userMap['is_gerente'],
      );
      log(user!.toJson().toString(), name: 'User');
    }
    log(user!.empresaId.toString());
    await UserService()
        .showFuncionarios(user!.empresaId.toString())
        .then((value) {
      var list = value.data['users'];
      funcionarios.addAll(list);
      log(funcionarios.toString(), name: 'Funci');
    }).whenComplete(() => setIsLoading());
  }

  @action
  getFuncionari(String userId) async {
    await UserService().showFuncionario(userId).then((value) {
      funcionario = {
        'nome': value.data['user']['name'],
        'email': value.data['user']['email'],
        'isGerente': value.data['user']['is_gerente'],
      };
      log(funcionario.toString(), name: 'Funcionario');
    });
  }

  @action
  delete(String userId, BuildContext context) async {
    await UserService().deleteUser(userId).then((value) {
      log(value.toString());
      // final snackBar = SnackBar(content: Text('${value.data['Status']}'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).whenComplete(() => getFuncionarios(context));
  }

  @action
  promover(String userId, BuildContext context) async {
    await UserService()
        .promoverFuncionario(context, userId)
        .whenComplete(() => getFuncionarios(context));
  }

  @action
  dispose() {
    funcionarios.clear();
  }
}
