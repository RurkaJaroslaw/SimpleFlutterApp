import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../model/weather.dart';
import '../widgets/value_tile.dart';

/// Renders Weather Icon, current, min and max temperatures
class CurrentConditions extends StatelessWidget {
  final Weather weather;
  const CurrentConditions({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          weather.getIconData(),
          color: AppStateContainer.of(context).theme.accentColor,
          size: 100,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '${this.weather.temperature.as(AppStateContainer.of(context).temperatureUnit).round()}°',
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w100,
              color: AppStateContainer.of(context).theme.accentColor),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: <Widget>[
          ValueTile(
            "MAX",'${this.weather.maxTemperature.as(AppStateContainer.of(context).temperatureUnit).round()}°',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            )),
          ),
          ValueTile(
            "MIN",'${this.weather.minTemperature.as(AppStateContainer.of(context).temperatureUnit).round()}°',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            )),
          ),
          ValueTile("wind speed", '${this.weather.windSpeed} m/s'),
           Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            )),
          ),
           ValueTile(
                "sunrise",
                DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    this.weather.sunrise * 1000))),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color:
                  AppStateContainer.of(context).theme.accentColor.withAlpha(50),
            )),
          ),
          ValueTile(
                "sunset",
                DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    this.weather.sunset * 1000)))
        ]),
      ],
    );
  }
}
