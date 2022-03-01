import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/helper/util.dart';
import 'package:admin/models/FormRecords.dart';
import 'package:admin/models/Template.dart';
import 'package:admin/models/WebUser.dart';
import 'package:admin/models/json_to_form/JsonToForm.dart';
import 'package:admin/responsive.dart';
import 'package:admin/service/user_service.dart';
import 'package:flutter/material.dart';

class SearchRecordsInfoModal extends StatefulWidget {
  final FormRecords record;
  const SearchRecordsInfoModal({Key? key, required this.record})
      : super(key: key);

  @override
  _SearchRecordsInfoModalState createState() => _SearchRecordsInfoModalState();
}

class _SearchRecordsInfoModalState extends State<SearchRecordsInfoModal> {
  Template form = Template(name: "", questions: []);

  @override
  void initState() {
    super.initState();
    form = Template.fromJson(json.decode(widget.record.jsonFile!));
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final UserService api = UserService();

    ScrollController scrollController = ScrollController();

    Future<Webuser> user =
        api.getUserById(widget.record.userCreated.toString());

    return Dialog(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: screen.width / 1.2,
        height: screen.height / 1.2,
        constraints:
            BoxConstraints(maxHeight: screen.height, maxWidth: screen.width),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Form: "),
                  SizedBox(width: 20),
                  Text(form.name)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Departament: "),
                  SizedBox(width: 20),
                  Text(widget.record.departament!)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Date: "),
                  SizedBox(width: 20),
                  Text(Util.formatDate(
                      widget.record.dateCreated!.toString().substring(0, 10)))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("User: "),
                  SizedBox(width: 20),
                  FutureBuilder<Webuser>(
                      future: user,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.firstName! +
                              " " +
                              snapshot.data!.lastName!);
                        } else {
                          return const SizedBox();
                        }
                      })
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screen.width / 1.4,
                    height: screen.height / 1.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: EdgeInsets.all(defaultPadding),
                      child: IgnorePointer(
                          child: JsonToForm(
                        form: jsonEncode(form),
                        onChanged: (dynamic response) {},
                        actionSave: (data) {},
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.all(0),
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
                        label: Text("Close"),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
