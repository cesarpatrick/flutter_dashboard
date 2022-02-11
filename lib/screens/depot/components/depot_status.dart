import 'package:admin/constants.dart';
import 'package:admin/screens/depot/components/depot_notes.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';
import 'depot_roster.dart';

class DepotStatus extends StatefulWidget {
  const DepotStatus({Key? key}) : super(key: key);

  @override
  _DepotStatusState createState() => _DepotStatusState();
}

class _DepotStatusState extends State<DepotStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, DEPOT_CHECKLIST_ROUTE);
              },
              icon: Icon(Icons.checklist),
              label: Text("Checklist"),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Roster",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Notes",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [DepotRoster(), DepotNotes()],
        ),
      ],
    );
  }
}
