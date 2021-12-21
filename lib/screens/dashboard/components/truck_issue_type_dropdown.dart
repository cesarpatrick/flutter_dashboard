import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:flutter/material.dart';

class TruckIssueTypeDropDown extends StatefulWidget {
  final int id;
  const TruckIssueTypeDropDown(this.id);

  @override
  _TruckIssueTypeDropDownState createState() => _TruckIssueTypeDropDownState();
}

class _TruckIssueTypeDropDownState extends State<TruckIssueTypeDropDown> {
  String _typeDropdownValue = "";

  @override
  Widget build(BuildContext context) {
    final TruckIssuesService apiTruckIssueService = TruckIssuesService();
    final Future<List<TruckIssueType>> typesList =
        apiTruckIssueService.getTruckIssueType();

    return FutureBuilder<List<TruckIssueType>>(
        future: typesList,
        builder: (context, snapshot) {
          List<TruckIssueType> list = snapshot.data!;
          List<DropdownMenuItem<String>> dropDownItemList = [];

          dropDownItemList
              .add(DropdownMenuItem<String>(value: "", child: Text("")));

          for (TruckIssueType item in list) {
            dropDownItemList.add(DropdownMenuItem<String>(
              value: item.name!,
              child: Text(item.name!),
            ));

            if (widget.id == item.id) {
              _typeDropdownValue = item.name!;
            }
          }

          return DropdownButton<String>(
            value: _typeDropdownValue,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (newValue) {
              setState(() {
                _typeDropdownValue = newValue!;
              });
            },
            items: dropDownItemList,
          );
        });
  }
}
