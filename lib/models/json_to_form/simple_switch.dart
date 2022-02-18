import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class SimpleSwitch extends StatefulWidget {
  SimpleSwitch({
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
  _SimpleSwitch createState() => new _SimpleSwitch();
}

class _SimpleSwitch extends State<SimpleSwitch> {
  dynamic item;

  String isRequired(item, value) {
    if (value.isEmpty) {
      return widget.errorMessages[item['key']] ?? 'Please enter some text';
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    item = widget.item;
    if (item['value'] == null) {
      item['value'] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool switchValue = false;

    if (item['value'] == "true") {
      switchValue = true;
    }

    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Row(children: <Widget>[
        Expanded(child: Text(item['label'], style: blackTextStyle)),
        new Switch(
          value: switchValue,
          inactiveTrackColor: Colors.grey,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blue,
          onChanged: (bool value) {
            this.setState(() {
              item['value'] = value;
              widget.onChange!(widget.position, value);
            });
          },
        )
      ]),
    );
  }
}
