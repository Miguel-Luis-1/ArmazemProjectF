// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionarios_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FuncionariosPageStore on FuncionariosPageStoreBase, Store {
  late final _$funcionariosAtom =
      Atom(name: 'FuncionariosPageStoreBase.funcionarios', context: context);

  @override
  ObservableList<dynamic> get funcionarios {
    _$funcionariosAtom.reportRead();
    return super.funcionarios;
  }

  @override
  set funcionarios(ObservableList<dynamic> value) {
    _$funcionariosAtom.reportWrite(value, super.funcionarios, () {
      super.funcionarios = value;
    });
  }

  late final _$diaogIsOpenAtom =
      Atom(name: 'FuncionariosPageStoreBase.diaogIsOpen', context: context);

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

  late final _$userAtom =
      Atom(name: 'FuncionariosPageStoreBase.user', context: context);

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

  late final _$funcionarioAtom =
      Atom(name: 'FuncionariosPageStoreBase.funcionario', context: context);

  @override
  Map<String, dynamic> get funcionario {
    _$funcionarioAtom.reportRead();
    return super.funcionario;
  }

  bool _funcionarioIsInitialized = false;

  @override
  set funcionario(Map<String, dynamic> value) {
    _$funcionarioAtom.reportWrite(
        value, _funcionarioIsInitialized ? super.funcionario : null, () {
      super.funcionario = value;
      _funcionarioIsInitialized = true;
    });
  }

  late final _$getFuncionariosAsyncAction = AsyncAction(
      'FuncionariosPageStoreBase.getFuncionarios',
      context: context);

  @override
  Future getFuncionarios(BuildContext context) {
    return _$getFuncionariosAsyncAction
        .run(() => super.getFuncionarios(context));
  }

  late final _$getFuncionariAsyncAction =
      AsyncAction('FuncionariosPageStoreBase.getFuncionari', context: context);

  @override
  Future getFuncionari(String userId) {
    return _$getFuncionariAsyncAction.run(() => super.getFuncionari(userId));
  }

  late final _$FuncionariosPageStoreBaseActionController =
      ActionController(name: 'FuncionariosPageStoreBase', context: context);

  @override
  dynamic setDialogState() {
    final _$actionInfo = _$FuncionariosPageStoreBaseActionController
        .startAction(name: 'FuncionariosPageStoreBase.setDialogState');
    try {
      return super.setDialogState();
    } finally {
      _$FuncionariosPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$FuncionariosPageStoreBaseActionController
        .startAction(name: 'FuncionariosPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$FuncionariosPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
funcionarios: ${funcionarios},
diaogIsOpen: ${diaogIsOpen},
user: ${user},
funcionario: ${funcionario}
    ''';
  }
}
