import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/pages/news_page.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/pages/court_embed_page.dart';
import 'package:tennis_club_app/presentation/pages/court_page.dart';
import 'package:tennis_club_app/presentation/pages/event_page.dart';
import 'package:tennis_club_app/presentation/pages/lineup_page.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainStore _store = locator<MainStore>();
  // Pages need to go here!
  final List<Widget> pages = [
    NewsPage(),
    (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
        ? CourtEmbedPage()
        : CourtPage(),
    const LineupPage(),
    EventPage(),
  ];

  @override
  Widget build(BuildContext context) {
    language = Localizations.localeOf(context).languageCode;
    return Observer(
        builder: (_) => Scaffold(
              key: _store.scaffoldKey,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: const Text('TB/ASV Regenstauf Tennis'),
                actions: <Widget>[
                  PopupMenuButton<String>(
                      onSelected: (value) => {},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              child: Text(_store.adminView.value
                                  ? AppLocalizations.of(context)!.logout
                                  : AppLocalizations.of(context)!.login),
                              onTap: () => _store.adminView.value
                                  ? {_store.checkPassword('')}
                                  : _dialogBuilder(context),
                            ),
                          ]),
                ],
              ),
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  _store.changePage(index);
                  if (Navigator.canPop(context)) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
                indicatorColor: Colors.amber[800],
                selectedIndex: _store.pageIndex,
                destinations: <Widget>[
                  NavigationDestination(
                    icon: const Icon(Icons.newspaper),
                    label: AppLocalizations.of(context)!.news,
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.sports_tennis),
                    label: AppLocalizations.of(context)!.court,
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.group),
                    label: AppLocalizations.of(context)!.lineup,
                  ),
                  NavigationDestination(
                      icon: const Icon(Icons.stadium),
                      label: AppLocalizations.of(context)!.events)
                ],
              ),
              body: pages[_store.pageIndex],
            ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController password = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.loginAdmin),
            content: null,
            actions: <Widget>[
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    hintText: AppLocalizations.of(context)!.password,
                  )),
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(AppLocalizations.of(context)!.login),
                  onPressed: () {
                    _store.checkPassword(password.value.text);
                    Navigator.pop(context);
                  },
                )
              ])
            ],
          );
        });
  }
}
