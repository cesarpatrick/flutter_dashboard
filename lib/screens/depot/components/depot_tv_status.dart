import 'package:admin/constants.dart';
import 'package:admin/screens/depot/components/depot_notes.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';
import 'depot_roster.dart';
import 'notes_editor_modal.dart';

class DepotTvStatus extends StatefulWidget {
  const DepotTvStatus({Key? key}) : super(key: key);

  @override
  _DepotTvStatusState createState() => _DepotTvStatusState();
}

class _DepotTvStatusState extends State<DepotTvStatus> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, DEPOT_ROUTE);
              },
              icon: Icon(Icons.close),
              label: Text("Exit Tv Mode"),
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
            Row(
              children: [
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
              ],
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: _screen.width / 2.1,
                height: _screen.height / 2,
                child: DepotRoster()),
            Container(
                width: _screen.width / 2.1,
                height: _screen.height / 2,
                child: DepotNotes(
                  isTvScreen: true,
                ))
          ],
        ),
      ],
    );
  }
}
