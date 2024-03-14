import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';
import 'package:tennis_club_app/presentation/widgets/GameAddWidget.dart';
import 'package:tennis_club_app/presentation/widgets/GameWidget.dart';

class LineupWidget extends StatelessWidget {
  LineupWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

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
    _lineupStore.getFavouriteTeam();
    _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
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
                    initialSelection: _lineupStore.selectedItem != ''
                        ? _lineupStore.selectedItem
                        : _lineupStore.teamNames.first,
                    label: const Text('Teamname'),
                    enableSearch: false,
                    dropdownMenuEntries: convertTeamNamesToEntries(),
                    onSelected: (value) {
                      _lineupStore.getGamesByTeam(value!);
                      _lineupStore.selectedItem = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => _lineupStore
                        .setFavouriteTeam(_lineupStore.selectedItem),
                    child: const Text('Mark as Favourite'),
                  ),
                  Visibility(visible: admin, child: const GameAddForm()),
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
