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

  late final _$ShowItemPageStoreBaseActionController =
      ActionController(name: 'ShowItemPageStoreBase', context: context);

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
item: ${item}
    ''';
  }
}
