import 'package:admin/models/chart_info.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChart extends StatelessWidget {
  final List<ChartInfo> data;
  final String title;

  PieChart(this.data, this.title);
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    List<charts.Series<ChartInfo, String>> series = [
      charts.Series(
          id: "piechart",
          data: data,
          domainFn: (ChartInfo series, _) => series.value1.toString(),
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
                child: charts.PieChart(series,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ]),
                    animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
