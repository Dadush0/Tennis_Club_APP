import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/main.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/localization/app_localizations.dart';

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
    _lineupStore.changeSubmitButtonText(AppLocalizations.of(context)!.next);

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.addNewGame),
              content: getCurrentWidget(_lineupStore.dialogIndex.value),
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
                                  .any((element) => element == '') ||
                              _lineupStore.manager[0] == '') {
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
                        _lineupStore.addGame();
                        _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
                      }
                      setState(() {});
                    })
              ],
            );
          });
        });
  }

  @action
  static Widget? getCurrentWidget(int index) {
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

  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController timePickerController = TextEditingController();
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
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.opponent,
              hintText: AppLocalizations.of(context)!.opponentName,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(AppLocalizations.of(context)!.home),
            Observer(
              builder: (_) => Switch.adaptive(
                  value: _lineupStore.switchButton.value,
                  trackColor: WidgetStateProperty.all(Colors.black38),
                  activeColor: Colors.cyan,
                  inactiveThumbColor: Colors.red,
                  onChanged: (bool value) {
                    _lineupStore.changeSwitchButton(value);
                    _lineupStore.location = value
                        ? AppLocalizations.of(context)!.away
                        : AppLocalizations.of(context)!.home;
                    if (_lineupStore.location ==
                        AppLocalizations.of(context)!.away) {
                      _lineupStore.cakeNames = [];
                    }
                  }),
            ),
            Text(AppLocalizations.of(context)!.away),
          ],
        ),
        TextField(
          controller: datePickerController
            ..text = Localization.formatDate(_lineupStore.dateTime),
          readOnly: true,
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.selectDate,
              labelText: AppLocalizations.of(context)!.selectDate),
          onTap: () => onTapDateFunction(context: context),
        ),
        TextField(
          controller: timePickerController
            ..text = Localization.formatTime(TimeOfDay(
                hour: _lineupStore.dateTime.hour,
                minute: _lineupStore.dateTime.minute)),
          readOnly: true,
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.selectTime,
              labelText: AppLocalizations.of(context)!.selectTime),
          onTap: () => onTapTimeFunction(context: context),
        )
      ],
    );
  }

  onTapDateFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(DateTime.now().year + 1),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: Locale(language),
    );
    if (pickedDate == null) return;
    datePickerController.text = Localization.formatDate(pickedDate);
    _lineupStore.dateTime = DateTime.now().copyWith(
        year: pickedDate.year,
        month: pickedDate.month,
        day: pickedDate.day,
        hour: _lineupStore.dateTime.hour,
        minute: _lineupStore.dateTime.minute);
  }

  onTapTimeFunction({required BuildContext context}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (pickedTime == null) return;
    timePickerController.text = Localization.formatTime(pickedTime);
    _lineupStore.dateTime = DateTime.now().copyWith(
        year: _lineupStore.dateTime.year,
        month: _lineupStore.dateTime.month,
        day: _lineupStore.dateTime.day,
        hour: pickedTime.hour,
        minute: pickedTime.minute);
  }
}

class AddPlayerInfoWidget extends StatelessWidget {
  AddPlayerInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

  @override
  @action
  Widget build(BuildContext context) {
    List<Widget> playerInputController = [];
    for (int index = 0; index < _lineupStore.playerNames.length; ++index) {
      playerInputController.add(TextField(
          controller: TextEditingController()
            ..text = _lineupStore.playerNames[index],
          onChanged: (value) {
            _lineupStore.playerNames[index] = value;
          },
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.player,
              labelText: AppLocalizations.of(context)!.player)));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: playerInputController,
    );
  }
}

class AddOrgaInfoWidget extends StatelessWidget {
  AddOrgaInfoWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

  @override
  @action
  Widget build(BuildContext context) {
    List<Widget> cakeInputController = [];
    if (_lineupStore.location != AppLocalizations.of(context)!.away) {
      if (_lineupStore.cakeNames.isEmpty) {
        _lineupStore.cakeNames = ['', '', ''];
      }
      for (int index = 0; index < _lineupStore.cakeNames.length; ++index) {
        cakeInputController.add(TextField(
            controller: TextEditingController()
              ..text = _lineupStore.cakeNames[index],
            onChanged: (value) {
              _lineupStore.cakeNames[index] = value;
            },
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.cake,
                labelText: AppLocalizations.of(context)!.cake)));
      }
    }
    cakeInputController.add(TextField(
        controller: TextEditingController()..text = _lineupStore.manager[0],
        onChanged: (value) {
          _lineupStore.manager[0] = value;
        },
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.manager,
            labelText: AppLocalizations.of(context)!.manager)));
    if (_lineupStore.location == AppLocalizations.of(context)!.away) {
      cakeInputController.add(TextField(
          controller: TextEditingController()..text = _lineupStore.manager[1],
          onChanged: (value) {
            _lineupStore.manager[1] = value;
          },
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.manager,
              labelText: AppLocalizations.of(context)!.manager)));
    }
    return Column(
        mainAxisSize: MainAxisSize.min, children: cakeInputController);
  }
}
