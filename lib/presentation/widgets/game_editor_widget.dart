import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/widgets/game_add_widget.dart';

class GameEditorWidget extends StatelessWidget {
  GameEditorWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
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
    _lineupStore.changeSubmitButtonText('Next');
    _lineupStore.setGameInfo(gameModel);
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Add new Game'),
              content: getCurrentWidget(_lineupStore.dialogIndex.value),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                    _lineupStore.dialogIndex.value = DialogState.gameInfo.index;
                  },
                ),
                OutlinedButton(
                    child: Text(_lineupStore.submitButton.value),
                    onPressed: () {
                      _lineupStore.dialogIndex.value++;

                      if (_lineupStore.dialogIndex.value ==
                          DialogState.orgaInfo.index) {
                        _lineupStore.changeSubmitButtonText('Submit');
                      }

                      if (_lineupStore.dialogIndex.value ==
                          DialogState.finished.index) {
                        Navigator.pop(context);
                        _lineupStore.dialogIndex.value = 0;
                        _lineupStore.editGame(gameModel);
                        _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
                      }
                      setState(() {});
                    })
              ],
            );
          });
        });
  }

  Widget? getCurrentWidget(int index) {
    if (index == DialogState.gameInfo.index) {
      return AddGameInfoWidget();
    } else if (index == DialogState.playerInfo.index) {
      return AddPlayerInfoWidget();
    } else if (index == DialogState.orgaInfo.index) {
      return AddOrgaInfoWidget();
    }
    return null;
  }
}
