import 'package:admin/models/JobInfo.dart';
import 'package:admin/models/Truck.dart';
import 'package:admin/models/TruckIssue.dart';
import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/models/TruckIssueRca.dart';
import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/service/truck_issues_service.dart';
import 'package:admin/service/truck_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'job_modal.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs();

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
            return Text('${snapshot.error}');
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
                  "Jobs",
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
        date: list[i].createdOn!.toString(),
        driver: list[i].webuserId!.toString(),
        issueType: list[i].truckIssueType!.toString(),
        message: list[i].issueNote!,
        category: list[i].truckIssueType!.toString(),
        note: list[i].workshopNote!,
        rca: list[i].workshopStatus!.toString(),
        truckRequested: list[i].createdOn!.toString() +
            " - " +
            list[i].updatedOn!.toString(),
        updated: list[i].updatedOn!.toString()));
  }

  return jobs;
}

DataRow recentJobsDataRow(JobInfo jobInfo, BuildContext context) {
  TextStyle textStyle = TextStyle(fontSize: 10);

  String truckRego = "";

  final TruckIssuesService apiTruckIssueService = TruckIssuesService();
  final TruckService apiTruckService = TruckService();

  Future<List<TruckIssueCategory>> listCategories =
      apiTruckIssueService.getTruckIssueCategories();
  Future<List<TruckIssueType>> listTypes =
      apiTruckIssueService.getTruckIssueType();

  Future<List<TruckIssueRca>> listRca = apiTruckIssueService.getTruckIssueRCA();

  Future<List<Truck>> listTrucks = apiTruckService.getTrucks();

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
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(Icons.car_repair, color: Colors.black),
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              FutureBuilder<List<Truck>>(
                  future: listTrucks,
                  builder: (context, snapshot) {
                    List<Truck> trucks = snapshot.data!;

                    if (snapshot.hasData) {
                      for (Truck t in trucks) {
                        if (jobInfo.truck! == t.id.toString()) {
                          truckRego = t.truckRego!;
                          return Text(t.truckRego!,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10));
                        }
                      }
                    }

                    return const SizedBox();
                  }),
            ],
          ), onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return JobModal(context, jobInfo);
            });
      }),
      DataCell(Text(jobInfo.date!, style: textStyle)),
      DataCell(Text(jobInfo.driver!, style: textStyle)),
      DataCell(FutureBuilder<List<TruckIssueType>>(
          future: listTypes,
          builder: (context, snapshot) {
            List<TruckIssueType> types = snapshot.data!;

            if (snapshot.hasData) {
              for (TruckIssueType c in types) {
                if (jobInfo.issueType! == c.id.toString()) {
                  return Text(
                    c.name!,
                    style: textStyle,
                  );
                }
              }
            }

            return const SizedBox();
          })),
      DataCell(new Container(
          child: new SingleChildScrollView(
              child: new Column(children: <Widget>[
        Text(jobInfo.message!, style: textStyle, textAlign: TextAlign.justify)
      ])))),
      DataCell(new Container(
          child: new SingleChildScrollView(
              child: new Column(children: <Widget>[
        Text(jobInfo.note!, style: textStyle, textAlign: TextAlign.justify)
      ])))),
      DataCell(Text(jobInfo.truckRequested!, style: textStyle)),
      DataCell(FutureBuilder<List<TruckIssueCategory>>(
          future: listCategories,
          builder: (context, snapshot) {
            List<TruckIssueCategory> categories = snapshot.data!;

            if (snapshot.hasData) {
              for (TruckIssueCategory c in categories) {
                if (jobInfo.category! == c.id.toString()) {
                  return Text(c.truckIssueCategory!, style: textStyle);
                }
              }
            }

            return const SizedBox();
          })),
      DataCell(FutureBuilder<List<TruckIssueRca>>(
          future: listRca,
          builder: (context, snapshot) {
            List<TruckIssueRca> rcaList = snapshot.data!;

            if (snapshot.hasData) {
              for (TruckIssueRca c in rcaList) {
                if (jobInfo.rca! == c.id.toString()) {
                  return Text(c.type!, style: textStyle);
                }
              }
            }

            return const SizedBox();
          })),
      DataCell(Text(jobInfo.updated!, style: textStyle)),
    ],
  );
}
