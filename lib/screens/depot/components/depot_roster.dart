import 'package:flutter/material.dart';

import '../../../constants.dart';

class DepotRoster extends StatefulWidget {
  const DepotRoster({Key? key}) : super(key: key);

  @override
  _DepotRosterState createState() => _DepotRosterState();
}

class _DepotRosterState extends State<DepotRoster> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Container(
        width: _screen.width / 2.5,
        height: _screen.height / 1.5,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Role',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Stephen')),
                DataCell(Text('Team Leader')),
              ]),
              DataRow(cells: [
                DataCell(Text('John')),
                DataCell(Text('Forklift Operator')),
              ]),
              DataRow(cells: [
                DataCell(Text('Harry')),
                DataCell(Text('Forklift Operator')),
              ]),
              DataRow(cells: [
                DataCell(Text('Peter')),
                DataCell(Text('Sorting Line')),
              ]),
              DataRow(cells: [
                DataCell(Text('John')),
                DataCell(Text('Sorting Line')),
              ]),
              DataRow(cells: [
                DataCell(Text('Maria')),
                DataCell(Text('Sorting Line')),
              ])
            ],
          ),
        ]));
  }
}
