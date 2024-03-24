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
                              child: Text(
                                  _store.adminView.value ? 'Logout' : 'Login'),
                              onTap: () => _store.adminView.value
                                  ? {_store.checkPassword('')}
                                  : _dialogBuilder(context),
                            ),
                            PopupMenuItem<String>(
                                child: Text(language == 'de_DE'
                                    ? 'English'
                                    : 'Deutsch'),
                                onTap: () => {/* TODO: switch language */}),
                          ]),
                ],
              ),
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  _store.changePage(index);
                },
                indicatorColor: Colors.amber[800],
                selectedIndex: _store.pageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    icon: Icon(Icons.newspaper),
                    label: 'News',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.sports_tennis),
                    label: 'Court',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.group),
                    label: 'Lineup',
                  ),
                  NavigationDestination(
                      icon: Icon(Icons.stadium), label: 'Events')
                ],
              ),
              body: MaterialApp(home: pages[_store.pageIndex]),
            ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController password = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login as Admin'),
            content: null,
            actions: <Widget>[
              TextField(
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                  )),
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Login'),
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
