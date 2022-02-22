import 'package:admin/constants.dart';
import 'package:admin/models/DepotDashboard.dart';
import 'package:admin/responsive.dart';
import 'package:admin/service/depot_dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class NotesEditorModal extends StatefulWidget {
  const NotesEditorModal({Key? key}) : super(key: key);

  @override
  _NotesEditorModalState createState() => _NotesEditorModalState();
}

class _NotesEditorModalState extends State<NotesEditorModal> {
  HtmlEditorController controller = HtmlEditorController();
  DepotDashboardService api = new DepotDashboardService();

  String notesHtml = "";

  String notes = "";
  void save() {
    api.save(DepotDashboard(id: 1, notes: notes));
  }

  @override
  void initState() {
    super.initState();
    api.getDepotDashboard('1').then((result) {
      setState(() {
        notesHtml = result.notes!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: screen.width,
        height: screen.height,
        constraints:
            BoxConstraints(maxHeight: screen.height, maxWidth: screen.width),
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
                      initialText: notesHtml,
                      darkMode: false),
                  otherOptions: OtherOptions(
                    height: screen.height / 1.3,
                  ),
                  callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                    notes = currentHtml!;
                  }, onChangeContent: (String? changed) {
                    notes = changed!;
                  })),
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
                        onPressed: () {
                          save();
                          Navigator.pop(context);
                        },
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
