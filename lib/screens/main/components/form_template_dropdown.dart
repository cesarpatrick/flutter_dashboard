import 'package:admin/constants.dart';
import 'package:admin/models/Template.dart';
import 'package:admin/service/template_service.dart';
import 'package:flutter/material.dart';

import 'progress_bar.dart';

class FormTemplateDropDown extends StatefulWidget {
  final int id;
  final ValueChanged<dynamic>? onChanged;
  const FormTemplateDropDown(this.id, this.onChanged);

  @override
  _FormTemplateDropDownState createState() => _FormTemplateDropDownState();
}

class _FormTemplateDropDownState extends State<FormTemplateDropDown> {
  Template? _typeDropdownValue;

  final TemplateService api = TemplateService();
  late Future<List<Template>> formTemplateList = api.getTemplates();

  void _handleChanged() {
    widget.onChanged!(_typeDropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Template>>(
        future: formTemplateList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton<Template>(
                isExpanded: true,
                value: _typeDropdownValue,
                style: const TextStyle(color: Colors.white),
                dropdownColor: bgColor,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                focusColor: Colors.white,
                onChanged: (newValue) {
                  _typeDropdownValue = newValue!;
                  _handleChanged();
                },
                items: snapshot.data!
                    .map((template) => DropdownMenuItem<Template>(
                          child: Text(template.name),
                          value: template,
                        ))
                    .toList());
          } else {
            return ProgressBar();
          }
        });
  }
}
