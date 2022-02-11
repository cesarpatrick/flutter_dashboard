import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/components/workshop_status.dart';
import 'package:flutter/material.dart';

import 'truck_status_widget.dart';

class TruckStatus extends StatefulWidget {
  const TruckStatus({Key? key}) : super(key: key);

  @override
  _TruckStatusState createState() => _TruckStatusState();
}

class _TruckStatusState extends State<TruckStatus> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Container(
          child: TruckStatusWidget(),
          width: _screen.width,
        )
      ],
    );
  }
}
