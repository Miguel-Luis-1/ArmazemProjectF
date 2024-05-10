import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/models/user.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'base_page_store.g.dart';

class BasePageStore = BasePageStoreBase with _$BasePageStore;

abstract class BasePageStoreBase with Store {
  @observable
  User? user;

  @observable
  bool isGerente = false;

  @action
  getUserTeste() {
    user = User(
      id: 1,
      nome: 'Nome do Usuário',
      email: 'email@dominio.com',
      empresaId: '0',
      isGerente: 0,
    );
  }

  @action
  getUser() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? dados = sharedPreferences.getString('user');
    if (dados == null) {
      log('Deslogado');
      user = null;
    } else {
      log(dados);
      Map<String, dynamic> userMap = jsonDecode(dados);
      user = User(
        id: userMap['id'],
        nome: userMap['name'],
        email: userMap['email'],
        empresaId: userMap['empresa_id'].toString(),
        isGerente: userMap['is_gerente'],
      );
      user!.isGerente == 1 ? isGerente = true : isGerente = false;
    }
  }

  @action
  dispose() {
    user = null;
  }
}
