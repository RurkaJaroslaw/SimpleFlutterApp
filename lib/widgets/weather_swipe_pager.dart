import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../main.dart';
import '../model/weather.dart';
import '../widgets/current_conditions.dart';
import '../widgets/empty_widget.dart';
import '../widgets/temperature_line_chart.dart';
import './wind_line_chart.dart';

class WeatherSwipePager extends StatelessWidget {
  const WeatherSwipePager({
    Key key,
    @required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: 3,
        index: 0,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CurrentConditions(
              weather: weather,
            );
          } else if (index == 1) {
            return TemperatureLineChart(
              weather.forecast,
              animate: true,
            );
          }
            else if (index == 2) {
            return WindLineChart(
              weather.forecast,
              animate: true,
            );
          }
          return EmptyWidget();
        },
        pagination: new SwiperPagination(
            margin: new EdgeInsets.all(5.0),
            builder: new DotSwiperPaginationBuilder(
                size: 5,
                activeSize: 5,
                color: AppStateContainer.of(context)
                    .theme
                    .accentColor
                    .withOpacity(0.4),
                activeColor:
                AppStateContainer.of(context).theme.accentColor)),
      ),
    );
  }
}
