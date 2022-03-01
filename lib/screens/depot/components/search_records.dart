import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/helper/util.dart';
import 'package:admin/models/FormRecordInfo.dart';
import 'package:admin/models/FormRecords.dart';
import 'package:admin/models/Template.dart';
import 'package:admin/models/WebUser.dart';
import 'package:admin/screens/main/components/form_template_dropdown.dart';
import 'package:admin/screens/main/components/progress_bar.dart';
import 'package:admin/service/form_records_service.dart';
import 'package:admin/service/user_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'serach_records_info_modal.dart';

class SearchRecords extends StatefulWidget {
  const SearchRecords({Key? key}) : super(key: key);

  @override
  _SearchRecordsState createState() => _SearchRecordsState();
}

class _SearchRecordsState extends State<SearchRecords> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  late Future<List<FormRecords>> records;
  String _departamentDropdownValue = "";

  List<DropdownMenuItem<String>> departamentTypeDropDownItemList =
      Util.getDepartamentsDropdownMenu();

  final FormRecordsService api = FormRecordsService();

  Template template = Template(name: "", questions: []);

  void filter() {
    records = api.getFormRecordsByFilter(FormRecords(
        template: template,
        dateCreated: selectedDate.toIso8601String(),
        departament: _departamentDropdownValue));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    records = api.getFormRecordsByFilter(FormRecords(
        template: template,
        dateCreated: dateController.text,
        departament: _departamentDropdownValue));

    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Padding(padding: EdgeInsets.all(15), child: Text("Forms")),
              Flexible(
                flex: 2,
                child: FormTemplateDropDown(0, (newValue) {
                  setState(() {
                    template = newValue;
                    filter();
                  });
                }),
              ),
              Padding(padding: EdgeInsets.all(15), child: Text("Departament")),
              Flexible(
                  flex: 2,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Icon(
                      // Add this
                      Icons.arrow_drop_down, // Add this
                      color: Colors.white, // Add this
                    ),
                    value: _departamentDropdownValue,
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: bgColor,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _departamentDropdownValue = newValue!;
                        filter();
                      });
                    },
                    items: departamentTypeDropDownItemList,
                  )),
              Flexible(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        readOnly: true,
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          filled: true,
                          suffixIcon: InkWell(
                            onTap: () {
                              _selectDate(context);
                              filter();
                            },
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding * 0.10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/calendar.svg",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )))
            ]),
            FutureBuilder<List<FormRecords>>(
                future: records,
                builder: (context, snapshot) {
                  List<FormRecords> list = List<FormRecords>.empty();
                  List jobs = List.empty();

                  if (snapshot.hasData) {
                    list = snapshot.data!;
                    jobs = _getJobInfoList(list);
                  } else {
                    return ProgressBar();
                  }

                  return Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 600,
                          child: DataTable2(
                            showCheckboxColumn: false,
                            columnSpacing: defaultPadding,
                            minWidth: 600,
                            dataRowHeight: 45,
                            columns: [
                              DataColumn(
                                label: Text("Form"),
                              ),
                              DataColumn(
                                label: Text("Departament"),
                              ),
                              DataColumn(
                                label: Text("Date"),
                              ),
                              DataColumn(
                                label: Text("User"),
                              )
                            ],
                            rows: List.generate(
                                jobs.length,
                                (index) =>
                                    formRecordsDataRow(jobs[index], context)),
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ]),
    );
  }

  _selectDate(BuildContext context) async {
    var outputFormat = DateFormat('dd/MM/yyyy');

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        dateController.text = outputFormat.format(selectedDate);
      });
  }

  List<FormRecordInfo> _getJobInfoList(List<FormRecords> list) {
    List<FormRecordInfo> records = [];
    for (int i = 0; i < list.length; i++) {
      Template template = Template.fromJson(json.decode(list[i].jsonFile!));

      records.add(new FormRecordInfo(
          date:
              Util.formatDate(list[i].dateCreated!.toString().substring(0, 10)),
          departament: list[i].departament!,
          user: list[i].userCreated.toString(),
          formName: template.name,
          record: list[i]));
    }

    return records;
  }

  DataRow formRecordsDataRow(FormRecordInfo jobInfo, BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 14);

    final UserService api = UserService();
    Future<Webuser> user = api.getUserById(jobInfo.user);

    return DataRow(
      onSelectChanged: (selected) {
        setState(() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SearchRecordsInfoModal(record: jobInfo.record);
              });
        });
      },
      cells: [
        DataCell(Text(jobInfo.formName, style: textStyle)),
        DataCell(Text(jobInfo.departament, style: textStyle)),
        DataCell(Text(jobInfo.date, style: textStyle)),
        DataCell(FutureBuilder<Webuser>(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    snapshot.data!.firstName! + " " + snapshot.data!.lastName!,
                    style: textStyle);
              } else {
                return const SizedBox();
              }
            })),
      ],
    );
  }
}
