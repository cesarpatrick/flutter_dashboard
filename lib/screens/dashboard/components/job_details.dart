import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'service_info_card.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Last 30 Days",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          ServiceInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Planned Service",
            amountOfFiles: "13",
            numOfFiles: 13,
          ),
          ServiceInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Unplanned Service",
            amountOfFiles: "20",
            numOfFiles: 20,
          ),
          ServiceInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Early Life Failure",
            amountOfFiles: "25",
            numOfFiles: 25,
          ),
          ServiceInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Accident",
            amountOfFiles: "2",
            numOfFiles: 2,
          ),
        ],
      ),
    );
  }
}
