import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class DepotNotes extends StatefulWidget {
  const DepotNotes({Key? key}) : super(key: key);

  @override
  _DepotNotesState createState() => _DepotNotesState();
}

class _DepotNotesState extends State<DepotNotes> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Container(
        width: _screen.width / 2.5,
        height: _screen.height / 2.5,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
            "Drag and drop pictures, movies and other files into your notes. You can also add content to notes right from Safari, Photos, Maps, and many other apps. \n\n Drag and drop pictures, movies and other files into your notes. You can also add content to notes right from Safari, Photos, Maps, and many other apps. \n\n Drag and drop pictures, movies and other files into your notes. You can also add content to notes right from Safari, Photos, Maps, and many other apps. Drag and drop pictures, movies and other files into your notes. You can also add content to notes right from Safari, Photos, Maps, and many other apps.Drag and drop pictures, movies and other files into your notes. You can also add content to notes right from Safari, Photos, Maps, and many other apps.",
            textAlign: TextAlign.justify));
  }
}
