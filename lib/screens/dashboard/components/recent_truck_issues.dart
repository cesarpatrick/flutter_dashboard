import 'package:admin/models/JobInfo.dart';
import 'package:admin/models/Truck.dart';
import 'package:admin/models/TruckIssue.dart';
import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/models/TruckIssueRca.dart';
import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/models/WebUser.dart';
import 'package:admin/screens/main/components/progress_bar.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:admin/service/truck_service.dart';
import 'package:admin/service/user_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helper/util.dart';
import 'job_modal.dart';

class RecentTruckIssues extends StatelessWidget {
  const RecentTruckIssues();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 13);

    final TruckIssuesService api = TruckIssuesService();
    Future<List<TruckIssue>> truckIssuesList = api.getList();
    return FutureBuilder<List<TruckIssue>>(
        future: truckIssuesList,
        builder: (context, snapshot) {
          List<TruckIssue> list = List<TruckIssue>.empty();
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
                Text(
                  "Truck issues",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 800,
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
                    rows: List.generate(jobs.length,
                        (index) => recentJobsDataRow(jobs[index], context)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

List<JobInfo> _getJobInfoList(List<TruckIssue> list) {
  List<JobInfo> jobs = [];
  for (int i = 0; i < list.length; i++) {
    jobs.add(new JobInfo(
        icon: "assets/icons/truck-icon.svg",
        truck: list[i].truckId!.toString(),
        date: Util.formatDate(list[i].createdOn!.toString().substring(0, 10)),
        driver: list[i].webuserId!.toString(),
        issueType: list[i].truckIssueType!.toString(),
        message: list[i].issueNote!,
        category: list[i].truckIssueType!.toString(),
        note: list[i].workshopNote!,
        rca: list[i].workshopStatus!.toString(),
        truckRequested:
            Util.formatDate(list[i].createdOn!.toString().substring(0, 10)),
        updated:
            Util.formatDate(list[i].updatedOn!.toString().substring(0, 10))));
  }

  return jobs;
}

DataRow recentJobsDataRow(JobInfo jobInfo, BuildContext context) {
  TextStyle textStyle = TextStyle(fontSize: 10);

  final TruckIssuesService apiTruckIssueService = TruckIssuesService();
  final TruckService apiTruckService = TruckService();
  final UserService userService = UserService();

  Future<TruckIssueCategory> category =
      apiTruckIssueService.getTruckIssueTypeCategoryById(jobInfo.category!);
  Future<TruckIssueType> truckIssueType =
      apiTruckIssueService.getTruckIssueTypeById(jobInfo.issueType!);
  Future<TruckIssueRca> issueRca =
      apiTruckIssueService.getTruckIssueTruckIssueRcaById(jobInfo.rca!);
  Future<Webuser> driver = userService.getUserById(jobInfo.driver!);

  Future<Truck> truck = apiTruckService.getTruckById(jobInfo.truck!);
  return DataRow(
    cells: [
      DataCell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(Icons.car_repair, color: Colors.black),
              ),
              SizedBox(
                width: 5,
                height: 5,
              ),
              FutureBuilder<Truck>(
                  future: truck,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.truckRego!,
                          style: TextStyle(color: Colors.red, fontSize: 10));
                    } else {
                      return const SizedBox();
                    }
                  }),
            ],
          ), onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return JobModal(jobInfo);
            });
      }),
      DataCell(Text(jobInfo.date!, style: textStyle)),
      DataCell(FutureBuilder<Webuser>(
          future: driver,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.firstName! + ' ' + snapshot.data!.lastName!,
                style: textStyle,
              );
            } else {
              return SizedBox();
            }
          })),
      DataCell(FutureBuilder<TruckIssueType>(
          future: truckIssueType,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.name!,
                style: textStyle,
              );
            } else {
              return SizedBox();
            }
          })),
      DataCell(new Container(
          child: new SingleChildScrollView(
              child: new Column(children: <Widget>[
        Text(jobInfo.message!, style: textStyle, textAlign: TextAlign.justify)
      ])))),
      DataCell(Text(jobInfo.truckRequested!, style: textStyle)),
      DataCell(FutureBuilder<TruckIssueCategory>(
          future: category,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.truckIssueCategory!, style: textStyle);
            } else {
              return const SizedBox();
            }
          })),
      DataCell(FutureBuilder<TruckIssueRca>(
          future: issueRca,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.type!, style: textStyle);
            } else {
              return const SizedBox();
            }
          })),
      DataCell(Text(jobInfo.updated!, style: textStyle)),
    ],
  );
}
