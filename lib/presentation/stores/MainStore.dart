import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/pages/CourtEmbedPage.dart';
import 'package:tennis_club_app/presentation/pages/CourtPage.dart';
import 'package:tennis_club_app/presentation/pages/EventPage.dart';
import 'package:tennis_club_app/presentation/pages/LineupPage.dart';
import 'package:tennis_club_app/presentation/pages/NewsPage.dart';

part 'MainStore.g.dart';

class MainStore = MainBase with _$MainStore;

abstract class MainBase with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // Pages need to go here!
  List<Widget> pages = [
    const NewsPage(), // NewsPage()
    (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
        ? CourtEmbedPage()
        : CourtPage(), // CourtPage()
    const LineupPage(), // LineUpPage()
    const EventPage(), // Eventpage()
  ];

  @observable
  int pageIndex = 0;

  // Maybe needed in the future
  @observable
  bool admin = true;

  @action
  void changePage(int index) {
    pageIndex = index;
  }
}
