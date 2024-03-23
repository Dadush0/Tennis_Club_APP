import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/check_password.dart';

part 'main_store.g.dart';

// ignore: library_private_types_in_public_api
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

  @action
  void getData() {}
}
