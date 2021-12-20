import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:flutter/material.dart';

class TruckIssueCategoriesDropDown extends StatefulWidget {
  const TruckIssueCategoriesDropDown();

  @override
  _TruckIssueCategoriesDropDownState createState() =>
      _TruckIssueCategoriesDropDownState();
}

class _TruckIssueCategoriesDropDownState
    extends State<TruckIssueCategoriesDropDown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = "";
    final TruckIssuesService apiTruckIssueService = TruckIssuesService();
    final Future<List<TruckIssueCategory>> categoriesList =
        apiTruckIssueService.getTruckIssueCategories();

    return DropdownButton<String>(
      value: dropdownValue,
      style: const TextStyle(color: Colors.black),
      dropdownColor: Colors.white,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        dropdownValue = newValue!;
      },
      items: <String>[
        'Compactor / Tail Gate Controls',
        'Brakes',
        'Flat Tyre',
        'Gear Box'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
