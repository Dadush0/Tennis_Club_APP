import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

class GameDeleteWidget extends StatelessWidget {
  GameDeleteWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: null,
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Yes'),
                  onPressed: () {
                    _lineupStore.deleteGame(gameModel);
                    _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
