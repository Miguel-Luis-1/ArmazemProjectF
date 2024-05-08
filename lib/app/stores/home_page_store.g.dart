// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on HomePageStoreBase, Store {
  late final _$itensAtom =
      Atom(name: 'HomePageStoreBase.itens', context: context);

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

  late final _$diaogIsOpenAtom =
      Atom(name: 'HomePageStoreBase.diaogIsOpen', context: context);

  @override
  bool get diaogIsOpen {
    _$diaogIsOpenAtom.reportRead();
    return super.diaogIsOpen;
  }

  @override
  set diaogIsOpen(bool value) {
    _$diaogIsOpenAtom.reportWrite(value, super.diaogIsOpen, () {
      super.diaogIsOpen = value;
    });
  }

  late final _$itemAtom =
      Atom(name: 'HomePageStoreBase.item', context: context);

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

  late final _$HomePageStoreBaseActionController =
      ActionController(name: 'HomePageStoreBase', context: context);

  @override
  dynamic setDialogState() {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.setDialogState');
    try {
      return super.setDialogState();
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getItens(BuildContext context) {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.getItens');
    try {
      return super.getItens(context);
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
diaogIsOpen: ${diaogIsOpen},
item: ${item}
    ''';
  }
}
