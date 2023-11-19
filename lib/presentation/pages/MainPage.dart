import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainBase _store = locator<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
              key: _store.scaffoldKey,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('TB/ASV Regenstauf Tennis'),
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
              body: _store.pages[_store.pageIndex],
            ));
  }
}
