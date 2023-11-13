import 'package:flutter/material.dart';
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
    _lineupStore.getGamesByTeam("Team2");

    return SingleChildScrollView(
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
            /*
            DataColumn(
              label: Expanded(
                child: Text(
                  'Time',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Team',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            */
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
          rows:
              convertGamesToDataRows(), /*const <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('21/10/2023')),
              DataCell(Text('13:00')),
              DataCell(Text('Prpject')),
              DataCell(Text('Home')),
              DataCell(Text('Amberg')),
              DataCell(Text('DAgostini \n writz \n fucker \n djkqg')),
              DataCell(Text('Writz')),
              DataCell(Text('Mineself')),
            ])
          ],*/
        ),
      ),
    );
  }
}
