import 'package:flutter/material.dart';

import 'functions.dart';

class SimpleDate extends StatefulWidget {
  SimpleDate({
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
  _SimpleDate createState() => new _SimpleDate();
}

class _SimpleDate extends State<SimpleDate> {
  dynamic item;

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    Widget label = SizedBox.shrink();
    if (Fun.labelHidden(item)) {
      label = new Container(
        child: new Text(item['label'],
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black)),
      );
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label,
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  // onTap: () {
                  //   selectDate();
                  // },
                  child: new TextFormField(
                controller: dateController,
                style: TextStyle(color: Colors.black),
                readOnly: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: item['value'] ?? "",
                  iconColor: Colors.black,
                  //prefixIcon: Icon(Icons.date_range_rounded),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        selectDate();
                      });
                    },
                    icon: Icon(Icons.calendar_today_rounded),
                    color: Colors.black,
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }

  Future selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime.now().add(new Duration(days: 720)));
    if (picked != null) {
      String date =
          "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year.toString()}";
      this.setState(() {
        item['value'] = date;
        dateController.text = date;
        widget.onChange!(widget.position, date);
      });
    }
  }
}
