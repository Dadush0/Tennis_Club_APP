import 'package:flutter/material.dart';

class LineupWidget extends StatelessWidget {
  const LineupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
      rows: const <DataRow>[
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
      ],
    );
  }
}
