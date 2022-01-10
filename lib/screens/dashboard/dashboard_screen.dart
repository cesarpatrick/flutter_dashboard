import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/workshop_status.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../main/components/header.dart';

import 'components/recent_jobs.dart';
import 'components/job_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      WorkshopStatusWidget(),
                      SizedBox(height: defaultPadding),
                      RecentJobs(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) JobDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: JobDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
