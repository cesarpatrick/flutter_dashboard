import 'package:admin/models/WorkshopStatusInfo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TruckStatusCard extends StatelessWidget {
  const TruckStatusCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final WorkshopStatusInfo info;

  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Container(
      width: _screen.width / 8,
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
              ),
              SizedBox(width: 20),
              Text(
                info.title!,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${info.value}/${info.value}",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            child: Text(
              "Navdeep",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "KRN534",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
