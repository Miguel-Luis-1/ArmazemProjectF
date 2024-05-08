import 'dart:developer';

import 'package:armazemf/app/models/item.dart';
import 'package:armazemf/app/service/itens_service.dart';
import 'package:mobx/mobx.dart';

part 'show_item_page_store.g.dart';

class ShowItemPageStore = ShowItemPageStoreBase with _$ShowItemPageStore;

abstract class ShowItemPageStoreBase with Store {
  @observable
  Item? item;
  @observable
  String? cretaeUser;
  getItem(String id) async {
    await ItensService().getItenById(id).then((value) async {
      log(value.data['user_id'].toString());
      item = Item(
        codigo: value.data['codigo'],
        nome: value.data['nome'],
        categoria: value.data['categoria'],
        descricao: value.data['descricao'],
        preco: value.data['preco'],
        qtdunitaria: value.data['qtdunitaria'],
        userId: value.data['user_id'].toString(),
        createdAt: value.data['created_at'].toString(),
        updatedAt: value.data['updated_at'].toString(),

      );
    });
    log(item!.nome.toString(), name: 'agas');
  }



  @action
  dispose() {}
}
