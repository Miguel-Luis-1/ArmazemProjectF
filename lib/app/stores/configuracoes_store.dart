import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/models/user.dart';
import 'package:armazemf/app/service/user_service.dart';
import 'package:mobx/mobx.dart';

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
  getUser() {
    UserService().getUserByToken().then(
      (value) {
        log(value.toString());
        Map<String, dynamic> data = jsonDecode(value);
        user = User.fromJson(data);
      },
    ).catchError((e) {
      log('Erro: ${e}');
    });
  }

  @action
  dispose() {
    user = null;
  }
}
