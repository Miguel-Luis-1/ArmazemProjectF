import 'dart:developer';

import 'package:armazemf/app/service/itens_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'graficos_page_store.g.dart';

class GraficosPageStore = GraficosPageStoreBase with _$GraficosPageStore;

abstract class GraficosPageStoreBase with Store {
  @observable
  ObservableList itens = ObservableList();
  @observable
  bool isLoading = false;

  @action
  setLoading() {
    isLoading = !isLoading;
    log(isLoading.toString());
  }

  @action
  getItens(BuildContext context) async {
    setLoading();
    await ItensService().getItens(context).then((value) {
      var list = value.data['itens'];
      itens.addAll(list);
      log(itens.toString(), name: 'itens');   
    }).whenComplete(() => setLoading());
  }

  @action
  dispose() {
    itens.clear();
  }
}
