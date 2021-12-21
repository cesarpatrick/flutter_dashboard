import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:flutter/material.dart';

class TruckIssueTypeDropDown extends StatelessWidget {
  const TruckIssueTypeDropDown();

  @override
  Widget build(BuildContext context) {
    TruckIssueType typeDropdownValue = TruckIssueType();
    final TruckIssuesService apiTruckIssueService = TruckIssuesService();
    final Future<List<TruckIssueType>> typesList =
        apiTruckIssueService.getTruckIssueType();

    return FutureBuilder<List<TruckIssueType>>(
        future: typesList,
        builder: (context, snapshot) {
          List<TruckIssueType> list = snapshot.data!;
          List<DropdownMenuItem<TruckIssueType>> dropDownItemList = [];

          for (TruckIssueType item in list) {
            typeDropdownValue = item;
            dropDownItemList.add(DropdownMenuItem<TruckIssueType>(
              value: item,
              child: Text(item.name!),
            ));
          }

          return DropdownButton<TruckIssueType>(
            value: typeDropdownValue,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (TruckIssueType? newValue) {
              typeDropdownValue = newValue!;
            },
            items: dropDownItemList,
          );
        });
  }
}
