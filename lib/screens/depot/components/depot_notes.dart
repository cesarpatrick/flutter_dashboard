import 'package:admin/constants.dart';
import 'package:admin/screens/depot/components/notes_editor_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DepotNotes extends StatefulWidget {
  const DepotNotes({Key? key}) : super(key: key);

  @override
  _DepotNotesState createState() => _DepotNotesState();
}

class _DepotNotesState extends State<DepotNotes> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    setState(() {});

    return Container(
        width: _screen.width / 2.5,
        height: _screen.height / 2.5,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: [
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
          new Center(
            child: SingleChildScrollView(
              child: Html(
                defaultTextStyle: TextStyle(color: Colors.white),
                data:
                    "Flutter – Working with Callback Functions Difficulty Level : Expert Last Updated : 15 Feb, 2021 In this article, we will see how we can use callback functions in flutter. We will learn about different methods to implement callback functions in flutter.  Callback is basically a function or a method that we pass as an argument into another function or a method to perform an action. In the simplest words, we can say that Callback or VoidCallback are used while sending data from one method to another and vice-versa. It is very important to maintain a continuous flow of data throughout the flutter app.  Let’s assume that you are working on an app.  This app displays some sort of data.  Now to alter the values in the application, there are 2 approaches that you can take, either change the state using various state altering techniques or change the value using a Callback. If we are to work with the Callback function there are 2 possible methods that we can use as shown below:",
                padding: EdgeInsets.all(8.0),
              ),
            ),
          )
        ]));
  }
}
