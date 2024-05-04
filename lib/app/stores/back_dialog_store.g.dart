// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_dialog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BackDialogStore on BackDialogStoreBase, Store {
  late final _$itensAtom =
      Atom(name: 'BackDialogStoreBase.itens', context: context);

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
      Atom(name: 'BackDialogStoreBase.diaogIsOpen', context: context);

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

  late final _$BackDialogStoreBaseActionController =
      ActionController(name: 'BackDialogStoreBase', context: context);

  @override
  dynamic setDialogState() {
    final _$actionInfo = _$BackDialogStoreBaseActionController.startAction(
        name: 'BackDialogStoreBase.setDialogState');
    try {
      return super.setDialogState();
    } finally {
      _$BackDialogStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$BackDialogStoreBaseActionController.startAction(
        name: 'BackDialogStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$BackDialogStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
diaogIsOpen: ${diaogIsOpen}
    ''';
  }
}
