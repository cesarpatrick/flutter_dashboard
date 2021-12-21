import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:flutter/material.dart';

class TruckIssueCategoriesDropDown extends StatefulWidget {
  final int id;
  const TruckIssueCategoriesDropDown(this.id);

  @override
  _TruckIssueCategoriesDropDownState createState() =>
      _TruckIssueCategoriesDropDownState();
}

class _TruckIssueCategoriesDropDownState
    extends State<TruckIssueCategoriesDropDown> {
  String categoryDropdownValue = "";

  @override
  Widget build(BuildContext context) {
    final TruckIssuesService apiTruckIssueService = TruckIssuesService();
    final Future<List<TruckIssueCategory>> categoriesList =
        apiTruckIssueService.getTruckIssueCategories();

    return FutureBuilder<List<TruckIssueCategory>>(
        future: categoriesList,
        builder: (context, snapshot) {
          List<TruckIssueCategory> list = snapshot.data!;
          List<DropdownMenuItem<String>> dropDownItemList = [];

          dropDownItemList
              .add(DropdownMenuItem<String>(value: "", child: Text("")));

          for (TruckIssueCategory item in list) {
            dropDownItemList.add(DropdownMenuItem<String>(
              value: item.truckIssueCategory,
              child: Text(item.truckIssueCategory!),
            ));

            if (widget.id == item.id) {
              categoryDropdownValue = item.truckIssueCategory!;
            }
          }

          return DropdownButton<String>(
            value: categoryDropdownValue,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (String? newValue) {
              setState(() {
                categoryDropdownValue = newValue!;
              });
            },
            items: dropDownItemList,
          );
        });
  }
}
