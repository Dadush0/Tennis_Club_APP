// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on MainBase, Store {
  late final _$pageIndexAtom =
      Atom(name: 'MainBase.pageIndex', context: context);

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

  late final _$loggedInAtom = Atom(name: 'MainBase.loggedIn', context: context);

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$adminModeAtom =
      Atom(name: 'MainBase.adminMode', context: context);

  @override
  bool get adminMode {
    _$adminModeAtom.reportRead();
    return super.adminMode;
  }

  @override
  set adminMode(bool value) {
    _$adminModeAtom.reportWrite(value, super.adminMode, () {
      super.adminMode = value;
    });
  }

  late final _$MainBaseActionController =
      ActionController(name: 'MainBase', context: context);

  @override
  void changePage(int index) {
    final _$actionInfo =
        _$MainBaseActionController.startAction(name: 'MainBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$MainBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
loggedIn: ${loggedIn},
adminMode: ${adminMode}
    ''';
  }
}
