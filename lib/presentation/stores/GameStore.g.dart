// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GameStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStore, Store {
  late final _$dialogIndexAtom =
      Atom(name: '_GameStore.dialogIndex', context: context);

  @override
  Observable<int> get dialogIndex {
    _$dialogIndexAtom.reportRead();
    return super.dialogIndex;
  }

  @override
  set dialogIndex(Observable<int> value) {
    _$dialogIndexAtom.reportWrite(value, super.dialogIndex, () {
      super.dialogIndex = value;
    });
  }

  late final _$submitButtonAtom =
      Atom(name: '_GameStore.submitButton', context: context);

  @override
  Observable<String> get submitButton {
    _$submitButtonAtom.reportRead();
    return super.submitButton;
  }

  @override
  set submitButton(Observable<String> value) {
    _$submitButtonAtom.reportWrite(value, super.submitButton, () {
      super.submitButton = value;
    });
  }

  late final _$switchButtonAtom =
      Atom(name: '_GameStore.switchButton', context: context);

  @override
  Observable<bool> get switchButton {
    _$switchButtonAtom.reportRead();
    return super.switchButton;
  }

  @override
  set switchButton(Observable<bool> value) {
    _$switchButtonAtom.reportWrite(value, super.switchButton, () {
      super.switchButton = value;
    });
  }

  late final _$changeSubmitButtonTextAsyncAction =
      AsyncAction('_GameStore.changeSubmitButtonText', context: context);

  @override
  Future<void> changeSubmitButtonText(String text) {
    return _$changeSubmitButtonTextAsyncAction
        .run(() => super.changeSubmitButtonText(text));
  }

  late final _$changeSwitchButtonAsyncAction =
      AsyncAction('_GameStore.changeSwitchButton', context: context);

  @override
  Future<void> changeSwitchButton(bool value) {
    return _$changeSwitchButtonAsyncAction
        .run(() => super.changeSwitchButton(value));
  }

  @override
  String toString() {
    return '''
dialogIndex: ${dialogIndex},
submitButton: ${submitButton},
switchButton: ${switchButton}
    ''';
  }
}
