import 'package:admin/models/chart_info.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScatterPlotChart extends StatelessWidget {
  final List<ChartInfo> data;
  final String title;

  ScatterPlotChart(this.data, this.title);
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    final maxMeasure = 300;

    List<charts.Series<ChartInfo, num>> series = [
      charts.Series(
          id: "scatterplotchart",
          data: data,
          domainFn: (ChartInfo series, _) => series.value1!,
          measureFn: (ChartInfo series, _) => series.value2,
          colorFn: (ChartInfo sales, _) {
            // Bucket the measure column value into 3 distinct colors.
            final bucket = sales.value2! / maxMeasure;

            if (bucket < 1 / 3) {
              return charts.MaterialPalette.blue.shadeDefault;
            } else if (bucket < 2 / 3) {
              return charts.MaterialPalette.red.shadeDefault;
            } else {
              return charts.MaterialPalette.green.shadeDefault;
            }
          })
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
                child: charts.ScatterPlotChart(series,
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(2016.0, 2022.0),
                    ),
                    animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
