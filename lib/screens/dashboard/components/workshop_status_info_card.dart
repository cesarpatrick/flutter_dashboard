import 'package:admin/models/WorkshopStatusInfo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class WorkShopStatusCard extends StatelessWidget {
  const WorkShopStatusCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final WorkshopStatusInfo info;

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
              info.title!,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Column()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${info.value}",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
