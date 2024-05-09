// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_item_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowItemPageStore on ShowItemPageStoreBase, Store {
  late final _$itemAtom =
      Atom(name: 'ShowItemPageStoreBase.item', context: context);

  @override
  Item get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  bool _itemIsInitialized = false;

  @override
  set item(Item value) {
    _$itemAtom.reportWrite(value, _itemIsInitialized ? super.item : null, () {
      super.item = value;
      _itemIsInitialized = true;
    });
  }

  late final _$cretaeUserAtom =
      Atom(name: 'ShowItemPageStoreBase.cretaeUser', context: context);

  @override
  String? get cretaeUser {
    _$cretaeUserAtom.reportRead();
    return super.cretaeUser;
  }

  @override
  set cretaeUser(String? value) {
    _$cretaeUserAtom.reportWrite(value, super.cretaeUser, () {
      super.cretaeUser = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ShowItemPageStoreBase.isLoading', context: context);

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

  late final _$getItemAsyncAction =
      AsyncAction('ShowItemPageStoreBase.getItem', context: context);

  @override
  Future getItem(String id) {
    return _$getItemAsyncAction.run(() => super.getItem(id));
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('ShowItemPageStoreBase.deleteItem', context: context);

  @override
  Future deleteItem(String itemId) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(itemId));
  }

  late final _$ShowItemPageStoreBaseActionController =
      ActionController(name: 'ShowItemPageStoreBase', context: context);

  @override
  dynamic setLoading() {
    final _$actionInfo = _$ShowItemPageStoreBaseActionController.startAction(
        name: 'ShowItemPageStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$ShowItemPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$ShowItemPageStoreBaseActionController.startAction(
        name: 'ShowItemPageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$ShowItemPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
item: ${item},
cretaeUser: ${cretaeUser},
isLoading: ${isLoading}
    ''';
  }
}
