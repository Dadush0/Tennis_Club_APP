import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/CheckPassword.dart';

part 'MainStore.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final CheckPassword _checkPassword = locator<CheckPassword>();

  @observable
  int pageIndex = 0;

  @observable
  Observable<bool> adminView = false.obs();

  @action
  void changePage(int index) {
    pageIndex = index;
  }

  @action
  void checkPassword(String password) async {
    adminView = (await _checkPassword.call(password)).obs();
  }
}
