import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'functions.dart';

class SimpleListCheckbox extends StatefulWidget {
  SimpleListCheckbox({
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
  _SimpleListCheckbox createState() => new _SimpleListCheckbox();
}

class _SimpleListCheckbox extends State<SimpleListCheckbox> {
  dynamic item;
  List<dynamic> selectItems = [];

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
    for (var i = 0; i < item['items'].length; i++) {
      if (item['items'][i]['value'] == "true") {
        selectItems.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> checkboxes = [];
    if (Fun.labelHidden(item)) {
      checkboxes.add(new Text(item['label'], style: blackTextStyle));
    }
    for (var i = 0; i < item['items'].length; i++) {
      checkboxes.add(
        new Row(
          children: <Widget>[
            new Checkbox(
              activeColor: Colors.black,
              value: item['items'][i]['value'] == "true" ? true : false,
              onChanged: (bool? value) {
                this.setState(
                  () {
                    item['items'][i]['value'] = value.toString();
                    if (value!) {
                      selectItems.add(i);
                    } else {
                      selectItems.remove(i);
                    }
                    widget.onChange!(widget.position, selectItems);
                    //_handleChanged();
                  },
                );
              },
            ),
            new Text(item['items'][i]['label'], style: blackTextStyle),
          ],
        ),
      );
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: checkboxes,
      ),
    );
  }
}
