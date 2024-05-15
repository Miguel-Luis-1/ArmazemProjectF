// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graficos_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GraficosPageStore on GraficosPageStoreBase, Store {
  late final _$itensAtom =
      Atom(name: 'GraficosPageStoreBase.itens', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'GraficosPageStoreBase.isLoading', context: context);

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

  late final _$getItensAsyncAction =
      AsyncAction('GraficosPageStoreBase.getItens', context: context);

  @override
  Future getItens(BuildContext context) {
    return _$getItensAsyncAction.run(() => super.getItens(context));
  }

  late final _$GraficosPageStoreBaseActionController =
      ActionController(name: 'GraficosPageStoreBase', context: context);

  @override
  dynamic setLoading() {
    final _$actionInfo = _$GraficosPageStoreBaseActionController.startAction(
        name: 'GraficosPageStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$GraficosPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$GraficosPageStoreBaseActionController.startAction(
        name: 'GraficosPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$GraficosPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
isLoading: ${isLoading}
    ''';
  }
}
