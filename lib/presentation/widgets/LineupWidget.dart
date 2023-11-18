import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';
import 'package:tennis_club_app/presentation/widgets/GameWidget.dart';

class LineupWidget extends StatelessWidget {
  LineupWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  String selectedItem = '';

  List<GameWidget> convertGamesToWidgets() {
    List<GameWidget> widgets = [];
    for (var game in _lineupStore.lineup.first.games) {
      widgets.add(GameWidget(gameModel: game));
    }
    return widgets;
  }

  List<DropdownMenuEntry<String>> convertTeamNamesToEntries() {
    List<DropdownMenuEntry<String>> entries = [];
    for (var name in _lineupStore.teamNames) {
      entries.add(DropdownMenuEntry<String>(value: name, label: name));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    _lineupStore.getGamesByTeam('Team1'); // getFavoriteTeam or first or none
    _lineupStore.getAllTeams();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownMenu<String>(
                    initialSelection:
                        'Team1', // TODO: create UseCase -> getFavoriteTeam
                    label: const Text('Teamname'),
                    enableSearch: false,
                    dropdownMenuEntries: convertTeamNamesToEntries(),
                    onSelected: (value) {
                      _lineupStore.getGamesByTeam(value!);
                      selectedItem = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => _lineupStore.setFavouriteTeam(
                        selectedItem), // TODO: create UseCase -> setFavouriteTeam
                    child: const Text('Mark as Favourite'),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: convertGamesToWidgets(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
