import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class SimpleSelect extends StatefulWidget {
  SimpleSelect({
    Key? key,
    @required this.item,
    @required this.onChange,
    @required this.position,
    this.errorMessages = const {},
    this.validations = const {},
    this.decorations = const {},
    this.keyboardTypes = const {},
  }) : super(key: key);
  final dynamic item;
  final Function? onChange;
  final int? position;
  final Map errorMessages;
  final Map validations;
  final Map decorations;
  final Map keyboardTypes;

  @override
  _SimpleSelect createState() => new _SimpleSelect();
}

class _SimpleSelect extends State<SimpleSelect> {
  dynamic item;

  String? isRequired(item, value) {
    if (value.isEmpty) {
      return widget.errorMessages[item['key']] ?? 'Please select one option';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    Widget label = SizedBox.shrink();
    if (Fun.labelHidden(item)) {
      label = new Text(item['label'], style: blackTextStyle);
    }

    String selectValue = "";

    if (item['value'] != "") {
      selectValue = item['value'];
    }

    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label,
          new DropdownButtonFormField<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            decoration: new InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )),
            hint: new Text("Select a user"),
            value: selectValue,
            onChanged: (String? newValue) {
              setState(() {
                item['value'] = newValue;
                widget.onChange!(widget.position, newValue);
              });
            },
            validator: (value) {
              if (widget.validations.containsKey(item['key'])) {
                return widget.validations[item['key']](item, value);
              }

              if (item.containsKey('required')) {
                if (item['required'] == true ||
                    item['required'] == 'True' ||
                    item['required'] == 'true') {
                  return isRequired(item, value);
                }
              }
              return null;
            },
            items: item['items'].map<DropdownMenuItem<String>>((dynamic data) {
              return DropdownMenuItem<String>(
                value: data['value'],
                child: new Text(
                  data['label'],
                  style: new TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
