import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';

class LineupWidget extends StatelessWidget {
  LineupWidget({super.key});
  final LineupStore _lineupStore = locator<LineupStore>();

  List<DataRow> convertGamesToDataRows() {
    List<DataRow> rows = [];
    for (var game in _lineupStore.lineup.first.games) {
      List<String> gameInfo = game.convertToStringList();
      DataRow row = DataRow(cells: []);
      for (var element in gameInfo) {
        row.cells.add(DataCell(Text(element)));
      }
      rows.add(row);
    }
    return rows;
  }

  List<DropdownMenuEntry<String>> convertTeamNamesToEntries() {
    List<DropdownMenuEntry<String>> entries = [];
    for (var name in _lineupStore.teamNames) {
      entries.add(DropdownMenuEntry<String>(value: name, label: name));
    }
    return entries;
  }

  List<DataColumn> createTableHeaderRow() {
    List<DataColumn> columns = [];
    List<String> headers = [
      'Date',
      'Where TF',
      'Opponent',
      'Players',
      'Cake and Pints',
      'Supervisor'
    ]; // to be moved in string file
    for (var header in headers) {
      columns.add(
        DataColumn(
          label: Expanded(
            child: Text(
              header,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      );
    }
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    _lineupStore.getGamesByTeam('Team1'); // getFavoriteTeam or first or none
    _lineupStore.getAllTeams();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownMenu<String>(
                    initialSelection:
                        'Team1', // TODO: create UseCase -> getFavoriteTeam
                    label: const Text('Teamname'),
                    enableSearch: false,
                    dropdownMenuEntries: convertTeamNamesToEntries(),
                    onSelected: (value) => _lineupStore.getGamesByTeam(value!),
                  ),
                  ElevatedButton(
                    onPressed:
                        () {}, // TODO: create UseCase -> setFavouriteTeam
                    child: const Text('Mark as Favourite'),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: createTableHeaderRow(),
                  rows: convertGamesToDataRows(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
