import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

enum DialogState { gameInfo, playerInfo, orgaInfo, finished }

class GameAddForm extends StatefulWidget {
  const GameAddForm({super.key});

  @override
  GameAddFormState createState() {
    return GameAddFormState();
  }
}

class GameAddFormState extends State<GameAddForm> {
  final LineupStore _lineupStore = locator<LineupStore>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => _dialogBuilder(context),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    _lineupStore.changeSubmitButtonText('Next');

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
                        _lineupStore.addGame();
                      }
                      setState(() {});
                      // TODO: Consider Reaction Builder
                    })
              ],
            );
          });
        });
  }

  @action
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

class AddGameInfoWidget extends StatelessWidget {
  AddGameInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

  @override
  @action
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
            controller: TextEditingController()
              ..text = _lineupStore.opponentName,
            onChanged: (value) {
              _lineupStore.opponentName = value;
            },
            decoration: const InputDecoration(
              labelText: 'Opponent',
              hintText: 'Name of opponent',
            )
            //errorText: 'Test'),

            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Home'),
            Observer(
              builder: (_) => Switch.adaptive(
                  value: _lineupStore.switchButton.value,
                  trackColor: MaterialStateProperty.all(Colors.black38),
                  activeColor: Colors.cyan,
                  inactiveThumbColor: Colors.red,
                  onChanged: (bool value) {
                    _lineupStore.changeSwitchButton(value);
                    _lineupStore.location = value ? 'Away' : 'Home';
                  }),
            ),
            const Text('Away'),
          ],
        )
      ],
    );
  }
}

class AddPlayerInfoWidget extends StatelessWidget {
  AddPlayerInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

  @override
  @action
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
            controller: TextEditingController()
              ..text = _lineupStore.playerNames[0],
            onChanged: (value) {
              _lineupStore.playerNames[0] = value;
            },
            decoration: const InputDecoration(hintText: 'Player 1')
            //errorText: 'Test'),
            ),
        TextField(
            controller: TextEditingController()
              ..text = _lineupStore.playerNames[1],
            onChanged: (value) {
              _lineupStore.playerNames[1] = value;
            },
            decoration: const InputDecoration(
              hintText: 'Player 2',
            )
            //errorText: 'Test'),
            ),
        TextField(
            controller: TextEditingController()
              ..text = _lineupStore.playerNames[2],
            onChanged: (value) {
              _lineupStore.playerNames[2] = value;
            },
            decoration: const InputDecoration(
              hintText: 'Player 3',
            )
            //errorText: 'Test'),
            ),
        TextField(
          controller: TextEditingController()
            ..text = _lineupStore.playerNames[3],
          decoration: const InputDecoration(
            hintText: 'Player 4',
          ),
          onChanged: (value) {
            _lineupStore.playerNames[3] = value;
          },
        ),
      ],
    );
  }
}

class AddOrgaInfoWidget extends StatelessWidget {
  AddOrgaInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();
  late GameModel gameModel;

  @override
  @action
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextField(
          controller: TextEditingController()..text = _lineupStore.cakeNames[0],
          onChanged: (value) {
            _lineupStore.cakeNames[0] = value;
          },
          decoration: const InputDecoration(hintText: 'Cake 1')
          //errorText: 'Test'),
          ),
      TextField(
          controller: TextEditingController()..text = _lineupStore.cakeNames[1],
          onChanged: (value) {
            _lineupStore.cakeNames[1] = value;
          },
          decoration: const InputDecoration(
            hintText: 'Cake 2',
          )
          //errorText: 'Test'),
          ),
      TextField(
          controller: TextEditingController()..text = _lineupStore.manager,
          onChanged: (value) {
            _lineupStore.manager = value;
          },
          decoration: const InputDecoration(
            hintText: 'Manager',
          )
          //errorText: 'Test'),
          ),
    ]);
  }
}
