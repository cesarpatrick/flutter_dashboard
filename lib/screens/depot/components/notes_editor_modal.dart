import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class NotesEditorModal extends StatefulWidget {
  const NotesEditorModal({Key? key}) : super(key: key);

  @override
  _NotesEditorModalState createState() => _NotesEditorModalState();
}

class _NotesEditorModalState extends State<NotesEditorModal> {
  @override
  Widget build(BuildContext context) {
    HtmlEditorController controller = HtmlEditorController();

    Size screen = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: screen.width / 1.2,
        height: screen.height / 1.2,
        constraints: BoxConstraints(
            maxHeight: screen.height / 1.2, maxWidth: screen.width / 1.2),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlEditor(
                controller: controller, //required
                htmlEditorOptions: HtmlEditorOptions(
                    autoAdjustHeight: false,
                    hint: "Your text here...",
                    darkMode: false),
                otherOptions: OtherOptions(
                  height: screen.height / 1.4,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 2 : 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                        label: Text("Cancel"),
                      )),
                  SizedBox(width: 5),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 2 : 1),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.save),
                        label: Text("Save"),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
