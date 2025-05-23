import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/widgets/game/game_add_widget.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

class GameEditorWidget extends StatelessWidget {
  GameEditorWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  final GameModel gameModel;

  List<Widget> createGameEditorForm(BuildContext context) {
    List<Widget> fields = [];
    for (var player in gameModel.players) {
      fields.add(TextFormField(
        initialValue: player.displayName,
        decoration:
            InputDecoration(hintText: AppLocalizations.of(context)!.player),
      ));
    }
    for (var cake in gameModel.cakes) {
      fields.add(TextFormField(
        initialValue: cake.displayName,
        decoration:
            InputDecoration(hintText: AppLocalizations.of(context)!.cake),
      ));
    }
    for (var manager in gameModel.manager) {
      fields.add(TextFormField(
        initialValue: manager.displayName,
        decoration:
            InputDecoration(hintText: AppLocalizations.of(context)!.manager),
      ));
    }
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
    _lineupStore.changeSubmitButtonText(AppLocalizations.of(context)!.next);
    _lineupStore.setGameInfo(gameModel);
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.editGame),
              content: GameAddFormState.getCurrentWidget(
                  _lineupStore.dialogIndex.value),
              actions: <Widget>[
                OutlinedButton(
                  child: Text(AppLocalizations.of(context)!.cancel),
                  onPressed: () {
                    Navigator.pop(context);
                    _lineupStore.dialogIndex.value = DialogState.gameInfo.index;
                  },
                ),
                OutlinedButton(
                    child: Text(_lineupStore.submitButton.value),
                    onPressed: () {
                      if (_lineupStore.dialogIndex.value ==
                          DialogState.gameInfo.index) {
                        if (_lineupStore.opponentName == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .gameInfoMissing)));
                          return;
                        }
                      } else if (_lineupStore.dialogIndex.value ==
                          DialogState.playerInfo.index) {
                        if (_lineupStore.playerNames
                            .any((element) => element == '')) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .playerInfoMissing)));
                          return;
                        } else if (_lineupStore.playerNames.length !=
                            _lineupStore.playerNames.toSet().toList().length) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .playerDuplicate)));
                          return;
                        }
                      } else if (_lineupStore.dialogIndex.value ==
                          DialogState.orgaInfo.index) {
                        if (_lineupStore.location !=
                            AppLocalizations.of(context)!.away) {
                          if (_lineupStore.cakeNames
                              .any((element) => element == '')) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .orgaInfoMissing)));
                            return;
                          } else if (_lineupStore.cakeNames.any((element) =>
                              !_lineupStore.playerNames.contains(element))) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .informationMisFit)));
                            return;
                          }
                        } else if (_lineupStore.manager[0] == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .orgaInfoMissing)));
                          return;
                        }
                        if (!_lineupStore.playerNames
                            .contains(_lineupStore.manager[0])) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .informationMisFit)));
                          return;
                        }
                      }
                      _lineupStore.dialogIndex.value++;
                      if (_lineupStore.dialogIndex.value ==
                          DialogState.orgaInfo.index) {
                        _lineupStore.changeSubmitButtonText(
                            AppLocalizations.of(context)!.submit);
                      } else if (_lineupStore.dialogIndex.value ==
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
}
