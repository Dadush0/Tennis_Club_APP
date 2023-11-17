import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

class GameWidget extends StatelessWidget {
  GameWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  final GameModel gameModel;

  List<Widget> convertGameToExpansion() {
    List<Widget> list = [];
    for (var player in gameModel.players) {
      if (gameModel.cakes.contains(player)) {
        if (gameModel.manager == player) {
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
                    subtitle: Center(child: Text(gameModel.date.toString())),
                    trailing: Icon(_lineupStore.customTileExpanded.value
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down),
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
}
