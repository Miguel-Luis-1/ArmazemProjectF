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

  late final _$codigoControllerAtom =
      Atom(name: 'CreateEditPageStoreBase.codigoController', context: context);

  @override
  TextEditingController get codigoController {
    _$codigoControllerAtom.reportRead();
    return super.codigoController;
  }

  @override
  set codigoController(TextEditingController value) {
    _$codigoControllerAtom.reportWrite(value, super.codigoController, () {
      super.codigoController = value;
    });
  }

  late final _$nomeControllerAtom =
      Atom(name: 'CreateEditPageStoreBase.nomeController', context: context);

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

  late final _$descricaoControllerAtom = Atom(
      name: 'CreateEditPageStoreBase.descricaoController', context: context);

  @override
  TextEditingController get descricaoController {
    _$descricaoControllerAtom.reportRead();
    return super.descricaoController;
  }

  @override
  set descricaoController(TextEditingController value) {
    _$descricaoControllerAtom.reportWrite(value, super.descricaoController, () {
      super.descricaoController = value;
    });
  }

  late final _$categoriaControllerAtom = Atom(
      name: 'CreateEditPageStoreBase.categoriaController', context: context);

  @override
  TextEditingController get categoriaController {
    _$categoriaControllerAtom.reportRead();
    return super.categoriaController;
  }

  @override
  set categoriaController(TextEditingController value) {
    _$categoriaControllerAtom.reportWrite(value, super.categoriaController, () {
      super.categoriaController = value;
    });
  }

  late final _$precoControllerAtom =
      Atom(name: 'CreateEditPageStoreBase.precoController', context: context);

  @override
  TextEditingController get precoController {
    _$precoControllerAtom.reportRead();
    return super.precoController;
  }

  @override
  set precoController(TextEditingController value) {
    _$precoControllerAtom.reportWrite(value, super.precoController, () {
      super.precoController = value;
    });
  }

  late final _$qtdunitariaControllerAtom = Atom(
      name: 'CreateEditPageStoreBase.qtdunitariaController', context: context);

  @override
  TextEditingController get qtdunitariaController {
    _$qtdunitariaControllerAtom.reportRead();
    return super.qtdunitariaController;
  }

  @override
  set qtdunitariaController(TextEditingController value) {
    _$qtdunitariaControllerAtom.reportWrite(value, super.qtdunitariaController,
        () {
      super.qtdunitariaController = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'CreateEditPageStoreBase.user', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'CreateEditPageStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getItenAsyncAction =
      AsyncAction('CreateEditPageStoreBase.getIten', context: context);

  @override
  Future getIten(String? id) {
    return _$getItenAsyncAction.run(() => super.getIten(id));
  }

  late final _$editAsyncAction =
      AsyncAction('CreateEditPageStoreBase.edit', context: context);

  @override
  Future edit(BuildContext context) {
    return _$editAsyncAction.run(() => super.edit(context));
  }

  late final _$createAsyncAction =
      AsyncAction('CreateEditPageStoreBase.create', context: context);

  @override
  Future create(BuildContext context) {
    return _$createAsyncAction.run(() => super.create(context));
  }

  late final _$CreateEditPageStoreBaseActionController =
      ActionController(name: 'CreateEditPageStoreBase', context: context);

  @override
  dynamic setIsLoading() {
    final _$actionInfo = _$CreateEditPageStoreBaseActionController.startAction(
        name: 'CreateEditPageStoreBase.setIsLoading');
    try {
      return super.setIsLoading();
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
titlePage: ${titlePage},
codigoController: ${codigoController},
nomeController: ${nomeController},
descricaoController: ${descricaoController},
categoriaController: ${categoriaController},
precoController: ${precoController},
qtdunitariaController: ${qtdunitariaController},
user: ${user},
isLoading: ${isLoading}
    ''';
  }
}
