import 'dart:developer';

import 'package:armazemf/app/models/item.dart';
import 'package:mobx/mobx.dart';

part 'create_edit_page_store.g.dart';

class CreateEditPageStore = CreateEditPageStoreBase with _$CreateEditPageStore;

abstract class CreateEditPageStoreBase with Store {
  @observable
  ObservableList itens = ObservableList();
  @observable
  Item? item;
  @observable
  String? titlePage;

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
  dispose() {
    itens.clear();
  }
}
