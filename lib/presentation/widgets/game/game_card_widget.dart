import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/localization.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/widgets/delete_widget.dart';
import 'package:tennis_club_app/presentation/widgets/game/game_editor_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameCardWidget extends StatelessWidget {
  GameCardWidget({super.key, required this.gameModel});
  final LineupStore _lineupStore = locator<LineupStore>();
  final MainStore _mainStore = locator<MainStore>();
  final GameModel gameModel;

  List<Widget> convertGameToExpansion(BuildContext context) {
    List<Widget> list = [];
    for (var player in gameModel.players) {
      if (gameModel.cakes
          .any((element) => element.displayName == player.displayName)) {
        if (gameModel.manager.displayName == player.displayName) {
          list.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                Flexible(
                    child: ListTile(
                        title: Text(AppLocalizations.of(context)!.cake))),
                Flexible(
                    child: ListTile(
                        title: Text(AppLocalizations.of(context)!.manager)))
              ]));
        } else {
          list.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(child: ListTile(title: Text(player.displayName))),
                Flexible(
                    child: ListTile(
                        title: Text(AppLocalizations.of(context)!.cake)))
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
                            '${getLocationLocalized(context, gameModel.location)} ${AppLocalizations.of(context)!.against} ${gameModel.opponentName}')),
                    subtitle: Center(
                        child:
                            Text(Localization.formatDateTime(gameModel.date))),
                    controlAffinity: ListTileControlAffinity.leading,
                    leading: Icon(_lineupStore.customTileExpanded.value
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down),
                    trailing: Wrap(children: <Widget>[
                      Visibility(
                          visible: _mainStore.adminView.value,
                          child: GameEditorWidget(gameModel: gameModel)),
                      Visibility(
                          visible: _mainStore.adminView.value,
                          child: DeleteWidget(delete: deleteGame)),
                    ]),
                    initiallyExpanded: false,
                    onExpansionChanged: (bool expanded) {
                      _lineupStore.customTileExpanded = expanded.obs();
                    },
                    children: convertGameToExpansion(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteGame() {
    _lineupStore.deleteGame(gameModel);
    _lineupStore.getGamesByTeam(_lineupStore.selectedItem);
  }

  String getLocationLocalized(BuildContext context, String location) {
    if (location == 'Home' || location == 'Heim') {
      return AppLocalizations.of(context)!.home;
    }
    return AppLocalizations.of(context)!.away;
  }
}
