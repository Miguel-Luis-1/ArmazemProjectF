import 'dart:developer';

import 'package:armazemf/app/models/item.dart';
import 'package:armazemf/app/service/itens_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = HomePageStoreBase with _$HomePageStore;

abstract class HomePageStoreBase with Store {
  @observable
  ObservableList itens = ObservableList();
  @observable
  bool diaogIsOpen = false;
  @observable
  Item? item;

  @action
  setDialogState() {
    diaogIsOpen = !diaogIsOpen;
  }

  @action
  getItens(BuildContext context) {
    ItensService().getItens(context).then((value) {
      log(value.data['itens'].toString(), name: 'Request Itens');
      var list = value.data['itens'];
      itens.addAll(list);
      log(itens.toString());
    });
  }

  @action
  dispose() {
    itens.clear();
  }
}
