// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEditPageStore on CreateEditPageStoreBase, Store {
  late final _$itensAtom =
      Atom(name: 'CreateEditPageStoreBase.itens', context: context);

  @override
  ObservableList<dynamic> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<dynamic> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  late final _$itemAtom =
      Atom(name: 'CreateEditPageStoreBase.item', context: context);

  @override
  Item? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Item? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$titlePageAtom =
      Atom(name: 'CreateEditPageStoreBase.titlePage', context: context);

  @override
  String? get titlePage {
    _$titlePageAtom.reportRead();
    return super.titlePage;
  }

  @override
  set titlePage(String? value) {
    _$titlePageAtom.reportWrite(value, super.titlePage, () {
      super.titlePage = value;
    });
  }

  late final _$CreateEditPageStoreBaseActionController =
      ActionController(name: 'CreateEditPageStoreBase', context: context);

  @override
  dynamic getIten(String? id) {
    final _$actionInfo = _$CreateEditPageStoreBaseActionController.startAction(
        name: 'CreateEditPageStoreBase.getIten');
    try {
      return super.getIten(id);
    } finally {
      _$CreateEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$CreateEditPageStoreBaseActionController.startAction(
        name: 'CreateEditPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$CreateEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
item: ${item},
titlePage: ${titlePage}
    ''';
  }
}
