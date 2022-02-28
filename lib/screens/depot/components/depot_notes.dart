import 'package:admin/constants.dart';
import 'package:admin/service/depot_dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class DepotNotes extends StatefulWidget {
  const DepotNotes({Key? key}) : super(key: key);

  @override
  _DepotNotesState createState() => _DepotNotesState();
}

class _DepotNotesState extends State<DepotNotes> {
  DepotDashboardService api = new DepotDashboardService();
  ScrollController scrollController = ScrollController();
  HtmlEditorController controller = HtmlEditorController();

  String notesHtml = "";

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
    Size _screen = MediaQuery.of(context).size;

    return Container(
        width: _screen.width,
        height: _screen.height / 1.5,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: [
          new Center(
            child: HtmlEditor(
                controller: controller,
                htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarItemHeight: 0,
                    defaultToolbarButtons: [
                      StyleButtons(style: false),
                      FontSettingButtons(
                          fontSizeUnit: false,
                          fontName: false,
                          fontSize: false),
                      FontButtons(
                          clearAll: false,
                          bold: false,
                          italic: false,
                          strikethrough: false,
                          subscript: false,
                          superscript: false,
                          underline: false),
                      ColorButtons(
                          foregroundColor: false, highlightColor: false),
                      ListButtons(listStyles: false, ol: false, ul: false),
                      ParagraphButtons(
                          alignCenter: false,
                          alignJustify: false,
                          alignLeft: false,
                          alignRight: false,
                          decreaseIndent: false,
                          increaseIndent: false,
                          textDirection: false,
                          lineHeight: false,
                          caseConverter: false),
                      InsertButtons(
                          link: false,
                          picture: false,
                          video: false,
                          audio: false,
                          table: false,
                          hr: false,
                          otherFile: false),
                    ]),
                htmlEditorOptions: HtmlEditorOptions(
                  characterLimit: 0,
                  initialText: notesHtml,
                  darkMode: false,
                ),
                otherOptions: OtherOptions(
                  height: _screen.height / 1.8,
                )),

            // Html(
            //   defaultTextStyle: TextStyle(color: Colors.white),
            //   data: notesHtml,
            //   padding: EdgeInsets.all(8.0),
            // ),
          ),
        ]));
  }
}
