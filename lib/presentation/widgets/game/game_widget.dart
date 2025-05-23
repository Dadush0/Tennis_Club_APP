import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/game/game_add_widget.dart';
import 'package:tennis_club_app/presentation/widgets/game/game_card_widget.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class GameWidget extends StatelessWidget {
  GameWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  final MainStore _mainStore = locator<MainStore>();

  List<GameCardWidget> convertGamesToWidgets() {
    List<GameCardWidget> widgets = [];
    _lineupStore.lineup.first.games.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    for (var game in _lineupStore.lineup.first.games) {
      widgets.add(GameCardWidget(gameModel: game));
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
    _lineupStore.getAllTeams();
    if (_lineupStore.selectedItem == '' && _lineupStore.teamNames.isNotEmpty) {
      _lineupStore.selectedItem = _lineupStore.teamNames.first;
    }
    _lineupStore.getGamesByTeam(_lineupStore.selectedItem);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownMenu<String>(
                  initialSelection: _lineupStore.selectedItem,
                  label: Text(AppLocalizations.of(context)!.teamname),
                  enableSearch: false,
                  dropdownMenuEntries: convertTeamNamesToEntries(),
                  onSelected: (value) {
                    _lineupStore.getGamesByTeam(value!);
                    _lineupStore.resetGameInfo(value);
                    _lineupStore.selectedItem = value;
                  },
                ),
                IconButton(
                  onPressed: () {
                    _lineupStore.setFavouriteTeam(_lineupStore.selectedItem);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.favourite)));
                  },
                  icon: Icon(Icons.favorite, color: Colors.red),
                ),
                Observer(
                  builder: (_) => Visibility(
                      visible: _mainStore.adminView.value,
                      child: const GameAddForm()),
                )
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
    );
  }
}
