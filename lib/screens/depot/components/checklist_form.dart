import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/models/FormRecords.dart';
import 'package:admin/models/Template.dart';
import 'package:admin/models/json_to_form/JsonToForm.dart';
import 'package:admin/screens/main/components/form_template_dropdown.dart';
import 'package:admin/service/form_records_service.dart';
import 'package:admin/service/template_service.dart';
import 'package:flutter/material.dart';

class CheckListForm extends StatefulWidget {
  const CheckListForm({Key? key}) : super(key: key);

  @override
  _CheckListFormState createState() => _CheckListFormState();
}

class _CheckListFormState extends State<CheckListForm> {
  TemplateService templateService = new TemplateService();
  FormRecordsService formRecordsService = new FormRecordsService();

  ScrollController scrollController = ScrollController();

  Template form = Template(name: "Select one", questions: []);

  @override
  void initState() {
    super.initState();
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(children: [
            Padding(padding: EdgeInsets.all(15), child: Text("Forms")),
            Flexible(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: FormTemplateDropDown(form.id == null ? 0 : 0, (newValue) {
                setState(() {
                  form = newValue as Template;
                });
              }),
            ))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: size.width / 1.25,
                  height: size.height / 1.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.all(defaultPadding),
                    child: JsonToForm(
                      form: jsonEncode(form),
                      onChanged: (dynamic response) {
                        setState(() {
                          update();
                          form = Template.fromJson(response);
                        });
                      },
                      actionSave: (data) {
                        formRecordsService.save(FormRecords(
                            departament: form.departament,
                            template: Template.fromJson(
                                json.decode(jsonEncode(data)))));
                      },
                      buttonSave: Container(
                        height: 40.0,
                        color: Colors.blueAccent,
                        child: const Center(
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ]));
  }
}
