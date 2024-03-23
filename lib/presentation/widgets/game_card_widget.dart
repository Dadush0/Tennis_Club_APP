import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/delete_widget.dart';
import 'package:tennis_club_app/presentation/widgets/game_editor_widget.dart';

class GameCardWidget extends StatelessWidget {
  GameCardWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  final MainStore _mainStore = locator<MainStore>();
  final GameModel gameModel;

  List<Widget> convertGameToExpansion() {
    List<Widget> list = [];
    for (var player in gameModel.players) {
      if (gameModel.cakes
          .any((element) => element.displayName == player.displayName)) {
        if (gameModel.manager.displayName == player.displayName) {
          list.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                const Flexible(child: ListTile(title: Text('Cake'))),
                const Flexible(child: ListTile(title: Text('Manager')))
              ]));
        } else {
          list.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                const Flexible(child: ListTile(title: Text('Cake')))
              ]));
        }
      } else {
        list.add(ListTile(title: Text(player.displayName)));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Observer(
                  builder: (_) => ExpansionTile(
                    title: Center(
                        child: Text(
                            '${gameModel.location} against ${gameModel.opponentName}')),
                    subtitle: Center(
                        child:
                            Text(Localization.formatDateTime(gameModel.date))),
                    controlAffinity: ListTileControlAffinity.leading,
                    leading: Icon(_lineupStore.customTileExpanded.value
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down),
                    trailing: Wrap(children: <Widget>[
                      Visibility(
                          visible: _mainStore.adminView.value,
                          child: GameEditorWidget(gameModel: gameModel)),
                      Visibility(
                          visible: _mainStore.adminView.value,
                          child: DeleteWidget(delete: deleteGame)),
                    ]),
                    initiallyExpanded: false,
                    onExpansionChanged: (bool expanded) {
                      _lineupStore.customTileExpanded = expanded.obs();
                    },
                    children: convertGameToExpansion(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteGame() {
    _lineupStore.deleteGame(gameModel);
    _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
  }
}
