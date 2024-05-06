// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageStore on LoginPageStoreBase, Store {
  late final _$emailControllerAtom =
      Atom(name: 'LoginPageStoreBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$senhaControllerAtom =
      Atom(name: 'LoginPageStoreBase.senhaController', context: context);

  @override
  TextEditingController get senhaController {
    _$senhaControllerAtom.reportRead();
    return super.senhaController;
  }

  @override
  set senhaController(TextEditingController value) {
    _$senhaControllerAtom.reportWrite(value, super.senhaController, () {
      super.senhaController = value;
    });
  }

  late final _$LoginPageStoreBaseActionController =
      ActionController(name: 'LoginPageStoreBase', context: context);

  @override
  dynamic login() {
    final _$actionInfo = _$LoginPageStoreBaseActionController.startAction(
        name: 'LoginPageStoreBase.login');
    try {
      return super.login();
    } finally {
      _$LoginPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$LoginPageStoreBaseActionController.startAction(
        name: 'LoginPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$LoginPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
senhaController: ${senhaController}
    ''';
  }
}
