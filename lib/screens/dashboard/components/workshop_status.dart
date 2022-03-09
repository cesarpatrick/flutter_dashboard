import 'package:admin/models/WorkshopStatus.dart';
import 'package:admin/models/WorkshopStatusInfo.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'workshop_status_info_card.dart';
import 'package:admin/service/workshop_status_service.dart';

class WorkshopStatusWidget extends StatelessWidget {
  const WorkshopStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Workshop Status",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, WORKSHOP_SERVICE_FORMS);
              },
              icon: Icon(Icons.library_books),
              label: Text("Service Forms"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: WorkshopStatusCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: WorkshopStatusCardGridView(),
          desktop: WorkshopStatusCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class WorkshopStatusCardGridView extends StatefulWidget {
  const WorkshopStatusCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  _WorkshopStatusCardGridViewState createState() =>
      _WorkshopStatusCardGridViewState();
}

class _WorkshopStatusCardGridViewState
    extends State<WorkshopStatusCardGridView> {
  @override
  Widget build(BuildContext context) {
    final WorkshopStatusService api = WorkshopStatusService();
    Future<WorkshopStatus> workshopStatus = api.getStatus();
    return FutureBuilder<WorkshopStatus>(
        future: workshopStatus,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = _getWorkshopInfoList(snapshot.data!);
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: widget.childAspectRatio,
              ),
              itemBuilder: (context, index) =>
                  WorkShopStatusCard(info: list[index]),
            );
          }

          return ProgressBar();
        });
  }

  List _getWorkshopInfoList(WorkshopStatus status) {
    List workshopInfo = [
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfIssuesReportedLast7Days,
          color: Colors.red,
          title: 'Number of Issues Reported Last 7 Days',
          icon: Icon(Icons.report, color: Colors.red)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfIssuesFixedLast7Days,
          color: Colors.green,
          title: 'Number of Issues Fixed Last 7 Days',
          icon: Icon(Icons.recommend, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfTrucksOffRoad,
          color: Colors.grey,
          title: 'Number of Truck Off Road',
          icon: Icon(Icons.car_repair_rounded, color: Colors.grey)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.yellow,
          title: 'Incomplete Issues',
          icon: Icon(Icons.thumb_down_rounded, color: Colors.yellow)),
    ];

    return workshopInfo;
  }
}
