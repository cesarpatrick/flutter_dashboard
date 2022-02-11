import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class SimpleRadios extends StatefulWidget {
  SimpleRadios({
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
  _SimpleRadios createState() => new _SimpleRadios();
}

class _SimpleRadios extends State<SimpleRadios> {
  dynamic item;
  late String radioValue;

  String? isRequired(item, value) {
    if (value == null || value.isEmpty) {
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
    List<Widget> radios = [];

    if (Fun.labelHidden(item)) {
      radios.add(new Text(item['label'],
          style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0)));
    }
    radioValue = item['value'];
    for (var i = 0; i < item['items'].length; i++) {
      radios.add(
        new Row(
          children: <Widget>[
            FormField(builder: (FormFieldState<bool> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Radio<dynamic>(
                      activeColor: Colors.black,
                      value: item['items'][i]['value'],
                      groupValue: radioValue,
                      onChanged: (dynamic value) {
                        this.setState(() {
                          radioValue = value;
                          item['value'] = value;
                          widget.onChange!(widget.position, value);
                        });
                      })
                ],
              );
            }, validator: (value) {
              if (value != null && value != "") return 'Please enter your name';
              return null;
            }),
            new Text(item['items'][i]['label'], style: blackTextStyle)
          ],
        ),
      );
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: radios,
      ),
    );
  }
}
