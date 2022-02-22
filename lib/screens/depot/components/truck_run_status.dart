import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'truck_status_widget.dart';

class TruckRunStatusScreen extends StatefulWidget {
  const TruckRunStatusScreen({Key? key}) : super(key: key);

  @override
  _TruckRunStatusScreenState createState() => _TruckRunStatusScreenState();
}

class _TruckRunStatusScreenState extends State<TruckRunStatusScreen> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Container(
          child: TruckRunStatusWidget(),
          width: _screen.width,
        )
      ],
    );
  }
}
