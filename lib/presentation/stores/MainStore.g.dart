// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$pageIndexAtom =
      Atom(name: '_MainStore.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$adminViewAtom =
      Atom(name: '_MainStore.adminView', context: context);

  @override
  Observable<bool> get adminView {
    _$adminViewAtom.reportRead();
    return super.adminView;
  }

  @override
  set adminView(Observable<bool> value) {
    _$adminViewAtom.reportWrite(value, super.adminView, () {
      super.adminView = value;
    });
  }

  late final _$_MainStoreActionController =
      ActionController(name: '_MainStore', context: context);

  @override
  void changePage(int index) {
    final _$actionInfo =
        _$_MainStoreActionController.startAction(name: '_MainStore.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPassword(String password) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore.checkPassword');
    try {
      return super.checkPassword(password);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
adminView: ${adminView}
    ''';
  }
}
