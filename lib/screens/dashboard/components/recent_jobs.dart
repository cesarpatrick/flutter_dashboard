import 'package:admin/models/JobInfo.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../../constants.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 14);
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jobs",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              dataRowHeight: 100,
              columns: [
                DataColumn(
                  label: Text("Truck", style: textStyle),
                ),
                DataColumn(
                  label: Text("Date", style: textStyle),
                ),
                DataColumn(
                  label: Text("Reported By", style: textStyle),
                ),
                DataColumn(
                  label: Text("Issue Type", style: textStyle),
                ),
                DataColumn(
                  label: Text("Message", style: textStyle),
                ),
                DataColumn(
                  label: Text("Note", style: textStyle),
                ),
                DataColumn(
                  label: Text("Requested", style: textStyle),
                ),
                DataColumn(
                  label: Text("Category", style: textStyle),
                ),
                DataColumn(
                  label: Text("RCA", style: textStyle),
                ),
                DataColumn(
                  label: Text("Updated", style: textStyle),
                )
              ],
              rows: List.generate(demoJobs.length,
                  (index) => recentJobsDataRow(demoJobs[index], context)),
            ),
          ),
        ],
      ),
    );
  }
}

showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        String dropdownValue = 'Brakes';
        String categoryDropdownValue = 'Planned Service';
        final format = DateFormat("dd-MM-yyyy");
        final timeFormat = DateFormat.jm();

        return Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                    onShowPicker:
                                        (context, currentValue) async {
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
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
                                  backgroundColor:
                                      Color.fromRGBO(33, 35, 50, 10),
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
      });
}

DataRow recentJobsDataRow(JobInfo jobInfo, BuildContext context) {
  TextStyle textStyle = TextStyle(fontSize: 12);

  return DataRow(
    cells: [
      DataCell(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.car_repair, color: Colors.black),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Text(
              jobInfo.truck!,
              style: textStyle,
            ),
          ],
        ),
        onTap: () {
          showSimpleModalDialog(context);
        },
      ),
      DataCell(Text(jobInfo.date!, style: textStyle)),
      DataCell(Text(jobInfo.driver!, style: textStyle)),
      DataCell(Text(jobInfo.issueType!, style: textStyle)),
      DataCell(Text(jobInfo.message!, style: textStyle)),
      DataCell(Text(jobInfo.note!, style: textStyle)),
      DataCell(Text(jobInfo.truckRequested!, style: textStyle)),
      DataCell(Text(jobInfo.category!, style: textStyle)),
      DataCell(Text(jobInfo.rca!, style: textStyle)),
      DataCell(Text(jobInfo.updated!, style: textStyle)),
    ],
  );
}
