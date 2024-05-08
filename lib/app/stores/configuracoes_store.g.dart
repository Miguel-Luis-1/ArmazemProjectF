// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracoesStore on ConfiguracoesStoreBase, Store {
  late final _$userAtom =
      Atom(name: 'ConfiguracoesStoreBase.user', context: context);

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

  late final _$getUserAsyncAction =
      AsyncAction('ConfiguracoesStoreBase.getUser', context: context);

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('ConfiguracoesStoreBase.logout', context: context);

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$ConfiguracoesStoreBaseActionController =
      ActionController(name: 'ConfiguracoesStoreBase', context: context);

  @override
  dynamic getUserTeste() {
    final _$actionInfo = _$ConfiguracoesStoreBaseActionController.startAction(
        name: 'ConfiguracoesStoreBase.getUserTeste');
    try {
      return super.getUserTeste();
    } finally {
      _$ConfiguracoesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$ConfiguracoesStoreBaseActionController.startAction(
        name: 'ConfiguracoesStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$ConfiguracoesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
