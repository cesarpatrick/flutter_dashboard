import 'package:admin/responsive.dart';
import 'package:admin/screens/depot/components/trucks_location.dart';
import 'package:admin/screens/main/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/depot_status.dart';
import 'components/truck_run_status.dart';

class DepotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Depot",
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      DepotStatus(),
                      SizedBox(height: defaultPadding),
                      TruckRunStatusScreen(),
                      SizedBox(height: defaultPadding),
                      TrucksLocation(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
