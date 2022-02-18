import 'package:admin/models/WorkshopStatus.dart';
import 'package:admin/models/WorkshopStatusInfo.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/progress_bar.dart';
import 'package:admin/service/truck_run_service.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'workshop_status_info_card.dart';
import 'package:admin/service/workshop_status_service.dart';

class TruckRunStatus extends StatelessWidget {
  const TruckRunStatus({
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
              "Trucks Status",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: TruckRunStatusCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: TruckRunStatusCardGridView(),
          desktop: TruckRunStatusCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TruckRunStatusCardGridView extends StatefulWidget {
  const TruckRunStatusCardGridView({
    Key? key,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  _TruckRunStatusCardGridViewState createState() =>
      _TruckRunStatusCardGridViewState();
}

class _TruckRunStatusCardGridViewState
    extends State<TruckRunStatusCardGridView> {
  @override
  Widget build(BuildContext context) {
    final TruckRunService api = TruckRunService();

    Future<List<TruckRunStatus>> runs = api.getTruckRunStatus();

    return FutureBuilder<List<TruckRunStatus>>(
        future: runs,
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
                  TruckStatusCard(info: list[index]),
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
          color: Colors.blue,
          title: 'G1',
          icon: Icon(Icons.liquor_outlined, color: Colors.blue)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfIssuesFixedLast7Days,
          color: Colors.blue,
          title: 'G2',
          icon: Icon(Icons.liquor_outlined, color: Colors.blue)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfTrucksOffRoad,
          color: Colors.blue,
          title: 'G3',
          icon: Icon(Icons.liquor_outlined, color: Colors.blue)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V1',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfTrucksOffRoad,
          color: Colors.green,
          title: 'V2',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V3',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V4',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfTrucksOffRoad,
          color: Colors.green,
          title: 'V5',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V6',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V7',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.numberOfTrucksOffRoad,
          color: Colors.green,
          title: 'V8',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green)),
      WorkshopStatusInfo(
          truckInService: [],
          value: status.incompleteIssues,
          color: Colors.green,
          title: 'V9',
          icon: Icon(Icons.change_circle_outlined, color: Colors.green))
    ];

    return workshopInfo;
  }
}
