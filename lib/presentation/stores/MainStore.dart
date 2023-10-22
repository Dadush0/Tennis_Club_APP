import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/presentation/pages/LineupPage.dart';

part 'MainStore.g.dart';

class MainStore = MainBase with _$MainStore;

abstract class MainBase with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // Pages need to go here!
  List<Widget> pages = [
    const Text('News'), // NewsPage()
    const Text('Courts'), // CourtPage()
    const LineupPage(), // LineUpPage()
    const Text('Pints'), // Eventpage()
  ];

  @observable
  int pageIndex = 0;

  // Maybe needed in the future
  @observable
  bool loggedIn = false;

  // Maybe needed in the future
  @observable
  bool adminMode = false;

  @action
  void changePage(int index) {
    pageIndex = index;
  }
}
