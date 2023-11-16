import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

class GameWidget extends StatelessWidget {
  GameWidget({super.key}); //, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  late GameModel gameModel;

  List<Widget> convertGameToExpansion() {
    List<Widget> list = [];
    for (var player in gameModel.players) {
      if (gameModel.cakes.contains(player)) {
        if (gameModel.manager == player) {
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                const Flexible(child: ListTile(title: Text('Cake'))),
                const Flexible(child: ListTile(title: Text('Manager')))
              ]);
        } else {
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                const Flexible(child: ListTile(title: Text('Cake')))
              ]);
        }
      } else {
        list.add(ListTile(title: Text(player.displayName)));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    _lineupStore.getLineup();
    gameModel = _lineupStore.lineup.first.games.first;
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Observer(
                  builder: (_) => ExpansionTile(
                    title: const Text('Home against Cunts'),
                    subtitle: const Text('21.07.23 10 am'),
                    trailing: Icon(_lineupStore.customTileExpanded.value
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down),
                    children: convertGameToExpansion(),
                    onExpansionChanged: (bool expanded) {
                      _lineupStore.customTileExpanded = expanded.obs();
                    },
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

/*
class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                ExpansionTile(
                  title: const Text('Home against Cunts'),
                  subtitle: const Text('21.07.23 10 am'),
                  trailing: Icon(
                    _customTileExpanded
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down,
                  ),
                  children: const <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(child: ListTile(title: Text('Player 1'))),
                          Flexible(child: ListTile(title: Text('Cake')))
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(child: ListTile(title: Text('Player 2'))),
                          Flexible(child: ListTile(title: Text('Cake'))),
                          Flexible(child: ListTile(title: Text('Manager')))
                        ]),
                    ListTile(title: Text('Player 3')),
                    ListTile(title: Text('Player 4')),
                  ],
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      _customTileExpanded = expanded;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
*/
