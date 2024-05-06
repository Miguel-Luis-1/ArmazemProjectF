// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroPageStore on CadastroPageStoreBase, Store {
  late final _$nomeControllerAtom =
      Atom(name: 'CadastroPageStoreBase.nomeController', context: context);

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: 'CadastroPageStoreBase.emailController', context: context);

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
      Atom(name: 'CadastroPageStoreBase.senhaController', context: context);

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

  late final _$codigoEmpresaControllerAtom = Atom(
      name: 'CadastroPageStoreBase.codigoEmpresaController', context: context);

  @override
  TextEditingController get codigoEmpresaController {
    _$codigoEmpresaControllerAtom.reportRead();
    return super.codigoEmpresaController;
  }

  @override
  set codigoEmpresaController(TextEditingController value) {
    _$codigoEmpresaControllerAtom
        .reportWrite(value, super.codigoEmpresaController, () {
      super.codigoEmpresaController = value;
    });
  }

  late final _$CadastroPageStoreBaseActionController =
      ActionController(name: 'CadastroPageStoreBase', context: context);

  @override
  dynamic cadastro() {
    final _$actionInfo = _$CadastroPageStoreBaseActionController.startAction(
        name: 'CadastroPageStoreBase.cadastro');
    try {
      return super.cadastro();
    } finally {
      _$CadastroPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$CadastroPageStoreBaseActionController.startAction(
        name: 'CadastroPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$CadastroPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeController: ${nomeController},
emailController: ${emailController},
senhaController: ${senhaController},
codigoEmpresaController: ${codigoEmpresaController}
    ''';
  }
}
