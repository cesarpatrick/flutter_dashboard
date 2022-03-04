import 'package:admin/models/chart_info.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedAreaChart extends StatelessWidget {
  final List<ChartInfo> data;
  final String title;

  StackedAreaChart(this.data, this.title);
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    List<charts.Series<ChartInfo, num>> series = [
      charts.Series(
          id: "stackedareachart",
          data: data,
          domainFn: (ChartInfo series, _) => series.value1!,
          measureFn: (ChartInfo series, _) => series.value2,
          colorFn: (ChartInfo series, _) => series.color)
    ];

    return Container(
      height: screen.height / 2,
      padding: EdgeInsets.all(25),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                this.title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.LineChart(
                  series,
                  domainAxis: const charts.NumericAxisSpec(
                    tickProviderSpec:
                        charts.BasicNumericTickProviderSpec(zeroBound: false),
                    viewport: charts.NumericExtents(2016.0, 2022.0),
                  ),
                  animate: true,
                  defaultRenderer: new charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
