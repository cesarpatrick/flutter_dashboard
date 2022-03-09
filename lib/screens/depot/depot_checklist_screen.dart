import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/checklist_form.dart';

class DepotCheckListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Header(
              title: "Depot Checklist",
            )),
        SizedBox(height: defaultPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  DepotCheckListForm(),
                  if (Responsive.isMobile(context))
                    SizedBox(height: defaultPadding),
                ],
              ),
            ),
            if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
          ],
        )
      ],
    ));
  }
}
