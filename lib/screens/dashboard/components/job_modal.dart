import 'package:admin/models/JobInfo.dart';
import 'package:admin/models/Truck.dart';
import 'package:admin/service/truck_service.dart';
import 'package:flutter/material.dart';

import 'truck_issue_category_dropdown.dart';
import 'truck_issue_type_dropdown.dart';

class JobModal extends StatelessWidget {
  final JobInfo jobInfo;
  const JobModal(this.jobInfo);

  @override
  Widget build(BuildContext context) {
    final TruckService apiTruckService = TruckService();

    Future<Truck> truck = apiTruckService.getTruckById(jobInfo.truck!);

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 650, maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                  backgroundColor: Color.fromRGBO(33, 35, 50, 10),
                  label: FutureBuilder<Truck>(
                      future: truck,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text("Job for " + snapshot.data!.truckRego!);
                        } else {
                          return const SizedBox();
                        }
                      })),
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
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Date Reported' + '   ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: jobInfo.date!.substring(0, 10) +
                                        '      ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Truck' + '   ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: jobInfo.truck! + '      ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Reported By' + '    ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: jobInfo.driver,
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
                          TruckIssueTypeDropDown(int.parse(jobInfo.issueType!))
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
                                  ..text = jobInfo.message!,
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
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: jobInfo.date!.substring(0, 10),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
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
                                      text: 'Date Of Completion',
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
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: jobInfo.updated!.substring(0, 10),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
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
                                    text: 'Workshop Note',
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
                                  ..text = jobInfo.note!,
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
                          TruckIssueCategoriesDropDown(
                              int.parse(jobInfo.category!))
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
                          )
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
