import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List listWeather = const []]) 
  : super(listWeather);
}

class WeatherFetching extends WeatherEvent {
  final String cityName;
  final double longitude;
  final double latitude;

  WeatherFetching(
    {
      this.cityName, 
      this.longitude, 
      this.latitude
    }
    )

    : assert(cityName != null || longitude != null || latitude != null),
    super([cityName, longitude, latitude]);

}

