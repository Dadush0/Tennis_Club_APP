import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

enum DialogState { gameInfo, playerInfo, orgaInfo, finished }

class GameAddWidget extends StatelessWidget {
  GameAddWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  late GameModel gameModel;

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
              content: const Text('WIP'), // AddGameInfoWidget(),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                    _lineupStore.dialogIndex.value = DialogState.gameInfo.index;
                    _lineupStore.changeSubmitButtonText('Next');
                  },
                ),
                OutlinedButton(
                    child: Text(_lineupStore.submitButton.value),
                    onPressed: () {
                      _lineupStore.dialogIndex.value++;
                      if (_lineupStore.dialogIndex.value ==
                          DialogState.finished.index) {
                        // Save Game
                        Navigator.pop(context);
                        _lineupStore.dialogIndex.value = 0;
                        _lineupStore.changeSubmitButtonText('Next');
                      } else if (_lineupStore.dialogIndex.value ==
                          DialogState.orgaInfo.index) {
                        _lineupStore.changeSubmitButtonText('Submit');
                      }
                      // TODO: Consider Reaction Builder
                    })
              ],
            ),
          );
        });
  }
}

class AddGameInfoWidget extends StatelessWidget {
  AddGameInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  late GameModel gameModel;

  @override
  @action
  Widget build(BuildContext context) {
    gameModel = _lineupStore.lineup.first.games.first;
    return Observer(
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Switch(
                    value: _lineupStore.switchButton.value,
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.red,
                    onChanged: (bool value) {
                      _lineupStore.switchButton.value = value;
                      _lineupStore.changeSwitchButton(value);
                    }),
              ],
            ));
  }
}
