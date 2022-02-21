import 'package:admin/models/TruckRunStatus.dart';
import 'package:admin/models/TruckRunStatusInfo.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/progress_bar.dart';
import 'package:admin/service/truck_run_service.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'truck_run_status_info_card.dart';

class TruckRunStatusWidget extends StatelessWidget {
  const TruckRunStatusWidget() : super();

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
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  _TruckRunStatusCardGridViewState createState() =>
      _TruckRunStatusCardGridViewState();
}

class _TruckRunStatusCardGridViewState
    extends State<TruckRunStatusCardGridView> {
  final TruckRunService api = TruckRunService();

  @override
  Widget build(BuildContext context) {
    Future<List<TruckRunStatus>> runs = api.getTruckRunStatus();
    return FutureBuilder<List<TruckRunStatus>>(
        future: runs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = _getRunStatusInfoList(snapshot.data);
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
                  TruckRunStatusInfoCard(info: list[index]),
            );
          }

          return ProgressBar();
        });
  }

  List _getRunStatusInfoList(List<TruckRunStatus>? listRunStatus) {
    List runStatusInfo = [];

    for (TruckRunStatus status in listRunStatus!) {
      if (status.runName!.startsWith('Glass') && status.count! > 0) {
        runStatusInfo.add(TruckRunStatusInfo(
            runName: status.runName,
            color: Colors.blue,
            truckRego: status.driverAndTruck,
            userName: status.wu == null ? '' : status.wu!.userName!,
            stops: status.stops,
            count: status.count,
            icon: Icon(Icons.wine_bar, color: Colors.blue)));
      }

      if (status.runName!.startsWith('Depot')) {
        runStatusInfo.add(TruckRunStatusInfo(
            runName: status.runName,
            color: Colors.yellow,
            truckRego: status.driverAndTruck,
            userName: status.wu == null ? '' : status.wu!.userName!,
            stops: status.stops,
            count: status.count,
            icon: Icon(Icons.cached, color: Colors.yellow)));
      }
    }
    return runStatusInfo;
  }
}
