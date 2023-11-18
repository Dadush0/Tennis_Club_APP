import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

class GameAddWidget extends StatelessWidget {
  GameAddWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  late GameModel gameModel;

  @action
  List<Widget> createGameEditorForm() {
    List<Widget> fields = [];
    if (_lineupStore.dialogIndex.value == 0) {
      fields.add(TextFormField(
        decoration: const InputDecoration(hintText: "Player"),
      ));
    } else if (_lineupStore.dialogIndex.value == 1) {
      fields.add(TextFormField(
        decoration: const InputDecoration(hintText: "Player"),
      ));
    } else {
      fields.add(TextFormField(
        decoration: const InputDecoration(hintText: "Cake"),
      ));
      fields.add(TextFormField(
        decoration: const InputDecoration(hintText: "Manager"),
      ));
    }
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    gameModel = _lineupStore.lineup.first.games.first;
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Observer(
            builder: (context) => AlertDialog(
              title: const Text('Add new Game'),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Work in Progress')
                ], // createGameEditorForm(),
              ),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                    _lineupStore.dialogIndex.value = 0;
                    _lineupStore.changeSubmitButtonText('Next');
                  },
                ),
                OutlinedButton(
                    child: Text(_lineupStore.submitButton.value),
                    onPressed: () {
                      _lineupStore.dialogIndex.value++;
                      if (_lineupStore.dialogIndex.value == 3) {
                        // Save Game
                        Navigator.pop(context);
                        _lineupStore.dialogIndex.value = 0;
                        _lineupStore.changeSubmitButtonText('Next');
                      } else if (_lineupStore.dialogIndex.value == 2) {
                        _lineupStore.changeSubmitButtonText('Submit');
                      }
                    })
              ],
            ),
          );
        });
  }
}
