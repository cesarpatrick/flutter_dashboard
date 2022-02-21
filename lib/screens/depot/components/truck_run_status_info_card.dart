import 'package:admin/models/TruckRunStatusInfo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TruckRunStatusInfoCard extends StatelessWidget {
  const TruckRunStatusInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final TruckRunStatusInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: info.icon,
              )
            ],
          ),
          Container(
            child: Text(
              info.runName!,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${info.stops}/${info.count}",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "${info.userName}",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "${info.truckRego!.split(':')[1]}",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
