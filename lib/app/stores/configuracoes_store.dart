import 'package:armazemf/app/models/user.dart';
import 'package:mobx/mobx.dart';

part 'configuracoes_store.g.dart';

class ConfiguracoesStore = ConfiguracoesStoreBase with _$ConfiguracoesStore;

abstract class ConfiguracoesStoreBase with Store {

  @observable 
  User? user;

  @action
  getUserTeste(){
    user = User(
    id: 1,
    nome: 'Nome do Usuário',
    email: 'email@dominio.com',
  );
  }


  @action
  dispose(){
    user = null;
  }
 
}
