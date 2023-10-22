import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentpageIndex = 0;
  final MainBase _store = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _store.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        bottomNavigationBar: Observer(
            builder: (_) => NavigationBar(
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentpageIndex = index;
                      _store.changePage(index);
                    });
                  },
                  indicatorColor: Colors.amber[800],
                  selectedIndex: currentpageIndex,
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
                )),
        body: Observer(
          builder: (_) => _store.pages[_store.pageIndex],
        ));
  }
}
