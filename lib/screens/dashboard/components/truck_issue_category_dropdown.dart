import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:flutter/material.dart';

class TruckIssueCategoriesDropDown extends StatelessWidget {
  const TruckIssueCategoriesDropDown();

  @override
  Widget build(BuildContext context) {
    TruckIssueCategory categoryDropdownValue = TruckIssueCategory();
    final TruckIssuesService apiTruckIssueService = TruckIssuesService();
    final Future<List<TruckIssueCategory>> categoriesList =
        apiTruckIssueService.getTruckIssueCategories();

    return FutureBuilder<List<TruckIssueCategory>>(
        future: categoriesList,
        builder: (context, snapshot) {
          List<TruckIssueCategory> list = snapshot.data!;
          List<DropdownMenuItem<TruckIssueCategory>> dropDownItemList = [];

          for (TruckIssueCategory item in list) {
            categoryDropdownValue = item;
            dropDownItemList.add(DropdownMenuItem<TruckIssueCategory>(
              value: item,
              child: Text(item.truckIssueCategory!),
            ));
          }

          return DropdownButton<TruckIssueCategory>(
            value: categoryDropdownValue,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (TruckIssueCategory? newValue) {
              categoryDropdownValue = newValue!;
            },
            items: dropDownItemList,
          );
        });
  }
}
