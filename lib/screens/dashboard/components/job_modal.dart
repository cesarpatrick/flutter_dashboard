import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class JobModal extends StatefulWidget {
  const JobModal({Key? key, required BuildContext context}) : super(key: key);

  @override
  _JobModalState createState() => _JobModalState();
}

class _JobModalState extends State<JobModal> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Brakes';
    String categoryDropdownValue = 'Planned Service';
    final format = DateFormat("dd-MM-yyyy");
    final timeFormat = DateFormat.jm();

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 750, maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                  backgroundColor: Color.fromRGBO(33, 35, 50, 10),
                  label: Text("Job for NSQ810")),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Date Reported' + '   ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '08/12/2021 13:10' + '      ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Truck' + '   ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'NSQ810' + '      ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Reported By' + '    ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'Cesar Gouveia',
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Issue Type',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(height: 20, width: 50),
                          DropdownButton<String>(
                            value: dropdownValue,
                            style: const TextStyle(color: Colors.black),
                            dropdownColor: Colors.white,
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              dropdownValue = newValue!;
                            },
                            items: <String>[
                              'Compactor / Tail Gate Controls',
                              'Brakes',
                              'Flat Tyre',
                              'Gear Box'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Note',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(height: 20, width: 80),
                          SizedBox(
                              height: 100,
                              width: 450,
                              child: TextField(
                                controller: TextEditingController()
                                  ..text =
                                      'I hit the corner of a roof of a building at the Fire station Te Atatu. some damage to roof. no damage to truck.',
                                readOnly: true,
                                style: TextStyle(color: Colors.black),
                                decoration: new InputDecoration(
                                    fillColor: Colors.grey,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )
                                    //fillColor: Colors.green
                                    ),
                                minLines:
                                    2, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Truck Request',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                              height: 40,
                              width: 160,
                              child: DateTimeField(
                                initialValue: new DateTime(2021),
                                style: TextStyle(color: Colors.black),
                                format: format,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )),
                              )),
                          SizedBox(height: 20, width: 10),
                          SizedBox(
                              height: 40,
                              width: 140,
                              child: DateTimeField(
                                initialValue: new DateTime(2021),
                                style: TextStyle(color: Colors.black),
                                format: timeFormat,
                                onShowPicker: (context, currentValue) async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        currentValue ?? DateTime.now()),
                                  );
                                  return DateTimeField.convert(time);
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )),
                              )),
                          SizedBox(height: 20, width: 20),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'Time Of Completion',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                              height: 40,
                              width: 160,
                              child: DateTimeField(
                                initialValue: new DateTime(2021),
                                style: TextStyle(color: Colors.black),
                                format: format,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )),
                              )),
                          SizedBox(height: 20, width: 10),
                          SizedBox(
                            height: 40,
                            width: 140,
                            child: DateTimeField(
                              initialValue: new DateTime(2021),
                              style: TextStyle(color: Colors.black),
                              format: timeFormat,
                              onShowPicker: (context, currentValue) async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.convert(time);
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Add Note',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(height: 20, width: 50),
                          SizedBox(
                              height: 100,
                              width: 450,
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                decoration: new InputDecoration(
                                    fillColor: Colors.black,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )
                                    //fillColor: Colors.green
                                    ),
                                minLines:
                                    2, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Previous Note',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(height: 20, width: 20),
                          SizedBox(
                              height: 100,
                              width: 450,
                              child: TextField(
                                controller: TextEditingController()
                                  ..text =
                                      'Humbolt has filled in damage report form \n #---#neville @ 09/12/2021 10:39',
                                readOnly: true,
                                style: TextStyle(color: Colors.black),
                                decoration: new InputDecoration(
                                    fillColor: Colors.grey,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    )
                                    //fillColor: Colors.green
                                    ),
                                minLines:
                                    2, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Category',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(height: 20, width: 50),
                          DropdownButton<String>(
                            value: categoryDropdownValue,
                            style: const TextStyle(color: Colors.black),
                            dropdownColor: Colors.white,
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              categoryDropdownValue = newValue!;
                            },
                            items: <String>[
                              'Planned Service',
                              'Unplanned Service',
                              'Accident',
                              'Truck Remote Problem'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              backgroundColor: Colors.red[400],
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                          SizedBox(height: 0, width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              backgroundColor: Color.fromRGBO(33, 35, 50, 10),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
