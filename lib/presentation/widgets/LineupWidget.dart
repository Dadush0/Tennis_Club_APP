import 'dart:developer';

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

  @override
  Widget build(BuildContext context) {
    _lineupStore.getGamesByTeam('Team1');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: DropdownMenu<String>(
                initialSelection: 'Team1',
                label: const Text("Team Name"),
                enableSearch: false,
                dropdownMenuEntries: const [
                  DropdownMenuEntry<String>(value: 'Team1', label: 'Team1'),
                  DropdownMenuEntry<String>(value: 'Team2', label: 'Team2')
                ],
                onSelected: (value) => _lineupStore.getGamesByTeam(value!),
              ),
            ),
            Observer(
              builder: (_) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Date',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Where TF',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Opponent',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Players',
                            style: TextStyle(fontStyle: FontStyle.italic),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Cake and Pints',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Supervisor',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: convertGamesToDataRows(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
