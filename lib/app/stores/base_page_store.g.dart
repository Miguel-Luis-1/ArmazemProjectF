// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasePageStore on BasePageStoreBase, Store {
  late final _$userAtom =
      Atom(name: 'BasePageStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isGerenteAtom =
      Atom(name: 'BasePageStoreBase.isGerente', context: context);

  @override
  bool get isGerente {
    _$isGerenteAtom.reportRead();
    return super.isGerente;
  }

  @override
  set isGerente(bool value) {
    _$isGerenteAtom.reportWrite(value, super.isGerente, () {
      super.isGerente = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('BasePageStoreBase.getUser', context: context);

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$BasePageStoreBaseActionController =
      ActionController(name: 'BasePageStoreBase', context: context);

  @override
  dynamic getUserTeste() {
    final _$actionInfo = _$BasePageStoreBaseActionController.startAction(
        name: 'BasePageStoreBase.getUserTeste');
    try {
      return super.getUserTeste();
    } finally {
      _$BasePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$BasePageStoreBaseActionController.startAction(
        name: 'BasePageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$BasePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isGerente: ${isGerente}
    ''';
  }
}
