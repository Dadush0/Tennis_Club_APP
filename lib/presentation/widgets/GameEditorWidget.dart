import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';

class GameEditorWidget extends StatelessWidget {
  const GameEditorWidget({super.key, required this.gameModel});
  final GameModel gameModel;

  List<Widget> createGameEditorForm() {
    List<Widget> fields = [];
    for (var player in gameModel.players) {
      fields.add(TextFormField(
        initialValue: player.displayName,
        decoration: const InputDecoration(hintText: "Player"),
      ));
    }
    for (var cake in gameModel.cakes) {
      fields.add(TextFormField(
        initialValue: cake.displayName,
        decoration: const InputDecoration(hintText: "Cake"),
      ));
    }
    fields.add(TextFormField(
      initialValue: gameModel.manager.displayName,
      decoration: const InputDecoration(hintText: "Manager"),
    ));
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Game'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: createGameEditorForm(),
            ),
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
                  child: const Text('Save'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
