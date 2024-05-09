import 'dart:developer';

import 'package:armazemf/app/models/item.dart';
import 'package:armazemf/app/service/itens_service.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'show_item_page_store.g.dart';

class ShowItemPageStore = ShowItemPageStoreBase with _$ShowItemPageStore;

abstract class ShowItemPageStoreBase with Store {
  @observable
  late Item item;
  @observable
  String? cretaeUser;
  @observable
  bool isLoading = false;

  @action
  setLoading() {
    isLoading = !isLoading;
    log(isLoading.toString(), name: 'Is Loading');
  }

  @action
  getItem(String id) async {
    setLoading();
    await ItensService().getItenById(id).then((value) async {
      log(value.data['user_id'].toString(), name: 'User Id');
      item = Item(
        id: value.data['id'],
        codigo: value.data['codigo'],
        nome: value.data['nome'],
        categoria: value.data['categoria'],
        descricao: value.data['descricao'],
        preco: value.data['preco'].toString(),
        qtdunitaria: value.data['qtdunitaria'],
        userId: value.data['user_id'].toString(),
        createdAt: value.data['created_at'].toString(),
        updatedAt: value.data['updated_at'].toString(),
        empresaId: value.data['empresa_id'].toString(),
      );
      log(item.toJson().toString(), name: 'Item');
    }).whenComplete(() => setLoading());
  }

  @action
  deleteItem(String itemId) async {
    await ItensService().deleteItem(itemId).whenComplete(() {
      Asuka.showDialog(
        builder: (dialogcontext) {
          return DialogBase(
            title: 'Item excluido com sucesso!',
            content: Container(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogcontext);
                  Modular.to.pushNamed('/');
                },
                child: const Text('ok'),
              ),
            ],
          );
        },
      );
    });
  }

  @action
  dispose() {
    item = Item(
      id: 0,
      codigo: 0,
      nome: '',
      categoria: '',
      descricao: '',
      preco: '0',
      qtdunitaria: 0,
      userId: '',
      createdAt: '0000-00-00T00:00:00.000000Z',
      updatedAt: '0000-00-00T00:00:00.000000Z',
      empresaId: '',
    );
  }
}
