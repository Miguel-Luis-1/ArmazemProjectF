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
    dynamic dados = sharedPreferences.getString('user').toString();
    Map<String, dynamic> jsoDados = jsonEncode(dados) as Map<String, dynamic>;
    user = User.fromJson(jsoDados);
  }

  @action
  dispose() {
    user = null;
  }
}
