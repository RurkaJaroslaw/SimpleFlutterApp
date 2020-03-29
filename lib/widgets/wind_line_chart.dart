import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../model/weather.dart';

/// Renders a line chart from forecast data
/// x axis - date
/// y axis - temperature
class WindLineChart extends StatelessWidget {
  final List<Weather> weatherList;
  final bool animate;

  WindLineChart(this.weatherList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40.0),
        child: charts.TimeSeriesChart(
            [
              new charts.Series<Weather, DateTime>(
                id: 'wS',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (Weather weather, _) =>
                    DateTime.fromMillisecondsSinceEpoch(weather.time * 1000),
                measureFn: (Weather weather, _) => weather.windSpeed,
                data: weatherList,
              ),
            ],
            animate: animate,
            behaviors: [new charts.ChartTitle('WIND SPEED')],
            primaryMeasureAxis: new charts.NumericAxisSpec(
                )));
  }
}
