import 'package:admin/constants.dart';
import 'package:admin/screens/depot/components/depot_notes.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';
import 'depot_roster.dart';
import 'notes_editor_modal.dart';

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
            ),
            SizedBox(width: 20),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CHECKLIST_RECORD_ROUTE);
              },
              icon: Icon(Icons.search),
              label: Text("Records"),
            ),
            SizedBox(width: 20),
            if (!Responsive.isMobile(context))
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, DEPOT_TV_ROUTE);
                },
                icon: Icon(Icons.aspect_ratio_rounded),
                label: Text("TV Mode"),
              )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                "Notes",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              new IconButton(
                color: Colors.blueAccent,
                icon: new Icon(Icons.create),
                highlightColor: Colors.pink,
                iconSize: 16,
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotesEditorModal();
                        });
                  });
                },
              ),
            ]),
            DepotNotes(
              isTvScreen: false,
            )
          ],
        ),
        SizedBox(height: defaultPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Roster",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            DepotRoster(),
          ],
        ),
      ],
    );
  }
}
