import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/models/user.dart';
import 'package:armazemf/app/service/user_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'configuracoes_store.g.dart';

class ConfiguracoesStore = ConfiguracoesStoreBase with _$ConfiguracoesStore;

abstract class ConfiguracoesStoreBase with Store {
  @observable
  User? user;

  @action
  getUserTeste() {
    user = User(
      id: 1,
      nome: 'Nome do Usuário',
      email: 'email@dominio.com',
    );
  }

  @action
  getUser() async {
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
  }

  @action
  logout() async {
    await UserService().logout();
  }

  @action
  dispose() {
    user = null;
  }
}
