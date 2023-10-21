import 'package:flutter/material.dart';
import 'package:tennis_club_app/presentation/pages/LineupPage.dart';
import 'package:tennis_club_app/presentation/widgets/LineupWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentpageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentpageIndex = index;
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
          NavigationDestination(icon: Icon(Icons.stadium), label: 'Events')
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          alignment: Alignment.center,
          child: LineupPage(),
        ),
        Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentpageIndex],
    );
  }
}
