import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'job_info_card.dart';

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
          JobInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Planned Service",
            amountOfJobsDone: "13",
            numOfJobs: 13,
          ),
          JobInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Unplanned Service",
            amountOfJobsDone: "20",
            numOfJobs: 20,
          ),
          JobInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Early Life Failure",
            amountOfJobsDone: "25",
            numOfJobs: 25,
          ),
          JobInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Accident",
            amountOfJobsDone: "2",
            numOfJobs: 2,
          ),
        ],
      ),
    );
  }
}
