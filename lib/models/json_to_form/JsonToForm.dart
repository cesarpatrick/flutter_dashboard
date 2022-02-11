import 'dart:convert';
import 'package:admin/constants.dart';
import 'package:admin/models/Template.dart';
import 'package:flutter/material.dart';

import 'simple_checkbox.dart';
import 'simple_date.dart';
import 'simple_radios.dart';
import 'simple_select.dart';
import 'simple_switch.dart';
import 'simple_text.dart';

class JsonToForm extends StatefulWidget {
  const JsonToForm({
    @required this.form,
    @required this.onChanged,
    this.padding,
    this.formMap,
    this.autovalidateMode,
    this.errorMessages = const {},
    this.validations = const {},
    this.decorations = const {},
    this.keyboardTypes = const {},
    this.buttonSave,
    this.actionSave,
  });

  final Map errorMessages;
  final Map validations;
  final Map decorations;
  final Map keyboardTypes;
  final String? form;
  final Map? formMap;
  final double? padding;
  final Widget? buttonSave;
  final Function? actionSave;
  final ValueChanged<dynamic>? onChanged;
  final AutovalidateMode? autovalidateMode;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(formMap ?? json.decode(form!));
}

class _CoreFormState extends State<JsonToForm> {
  dynamic formGeneral;

  dynamic radioValue;

  List<Widget> jsonToForm() {
    List<Widget> listWidget = [];
    if (formGeneral['name'] != null) {
      listWidget.add(Text(
        formGeneral['name'],
        style: new TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
      ));
    }

    listWidget.add(SizedBox(height: 30));

    if (formGeneral['description'] != null) {
      listWidget.add(Text(
        formGeneral['description'],
        style: new TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
      ));
    }

    // for (var count = 0; count < formGeneral['fields'].length; count++) {
    //   Map item = formGeneral['fields'][count];

    for (var count = 0; count < formGeneral['questions'].length; count++) {
      Map question = formGeneral['questions'][count];
      Map item = question['field'];

      if (item['type'] == "Input" ||
          item['type'] == "Password" ||
          item['type'] == "Email" ||
          item['type'] == "TextArea" ||
          item['type'] == "TextInput") {
        listWidget.add(new SimpleText(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }

      if (item['type'] == "RadioButton") {
        listWidget.add(new SimpleRadios(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }

      if (item['type'] == "Switch") {
        listWidget.add(new SimpleSwitch(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }

      if (item['type'] == "Checkbox") {
        listWidget.add(new SimpleListCheckbox(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }

      if (item['type'] == "Select") {
        listWidget.add(new SimpleSelect(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }

      if (item['type'] == "Date") {
        listWidget.add(new SimpleDate(
          item: item,
          onChange: onChange,
          position: count,
          decorations: widget.decorations,
          errorMessages: widget.errorMessages,
          validations: widget.validations,
          keyboardTypes: widget.keyboardTypes,
        ));
      }
    }

    if (widget.buttonSave != null) {
      listWidget.add(new Container(
        margin: EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              widget.actionSave!(formGeneral);
            }
          },
          child: widget.buttonSave,
        ),
      ));
    }

    return listWidget;
  }

  _CoreFormState(this.formGeneral);

  void _handleChanged() {
    widget.onChanged!(formGeneral);
  }

  void onChange(int position, dynamic value) {
    this.setState(() {
      Template template = Template.fromJson(formGeneral);

      switch (template.questions[position].field!.type) {
        case SWITCH:
          formGeneral['fields'][position]['value'] = value;
          template.questions[position].field!.value = value;
          break;
        case CHECKBOX_INPUT:
          template.questions[position].field!.items![position - 1].value =
              value;
          break;
        case RADIO_BUTTON_INPUT:
          template.questions[position].field!.value = value;
          break;
        default:
      }

      formGeneral = template.toJson();
      this._handleChanged();
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    formGeneral = json.decode(widget.form!);
    // Template template = Template.fromJson(formGeneral);
    // List<Question> q = template.questions;
    return Form(
      autovalidateMode:
          formGeneral['autoValidated'] ?? AutovalidateMode.disabled,
      key: _formKey,
      child: new Container(
        padding: new EdgeInsets.all(widget.padding ?? 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: jsonToForm(),
        ),
      ),
    );
  }
}
