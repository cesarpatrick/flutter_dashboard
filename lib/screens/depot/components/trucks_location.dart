import 'package:admin/constants.dart';
import 'package:admin/screens/main/components/get_map_widget.dart';
import 'package:admin/screens/main/components/truck_tracker_widget.dart';
import 'package:flutter/material.dart';

class TrucksLocation extends StatefulWidget {
  const TrucksLocation({Key? key}) : super(key: key);

  @override
  _TrucksLocationState createState() => _TrucksLocationState();
}

class _TrucksLocationState extends State<TrucksLocation> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trucks Location",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: defaultPadding),
        Container(
          child: TruckTrackerWidget(),
          width: _screen.width,
          height: _screen.height / 1.3,
        )
      ],
    );
  }
}
