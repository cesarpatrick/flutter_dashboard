import 'package:admin/models/chart_info.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/header.dart';
import 'package:admin/screens/reports/charts/horizontal_bar_chart.dart';
import 'package:admin/screens/reports/charts/pie_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'charts/bar_chart.dart';
import 'charts/line_chart.dart';
import 'charts/scatter_plot_chart.dart';
import 'charts/stacked_area_chart.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartInfo> data = [
      ChartInfo(
        value1: 2017,
        value2: 100000,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      ChartInfo(
        value1: 2018,
        value2: 5000,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      ChartInfo(
        value1: 2019,
        value2: 40000,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      ChartInfo(
        value1: 2020,
        value2: 80000,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      ChartInfo(
        value1: 2021,
        value2: 45000,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Reports",
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      BarChart(data, "Yearly Growth in the Flutter Community"),
                      PieChart(data, "Yearly Growth in the Flutter Community"),
                      LineChart(data, "Yearly Growth in the Flutter Community"),
                      StackedAreaChart(
                          data, "Yearly Growth in the Flutter Community"),
                      HorizontalBarChart(
                          data, "Yearly Growth in the Flutter Community"),
                      ScatterPlotChart(
                          data, "Yearly Growth in the Flutter Community"),
                      SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
