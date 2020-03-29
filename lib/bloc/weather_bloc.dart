import 'package:bloc/bloc.dart';
import '../model/weather.dart';
import 'package:meta/meta.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../repository/weather_repository.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  @override
  WeatherState get initialState {
    return WeatherEmpty();
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherFetching) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(
            event.cityName,
            latitude: event.latitude,
            longitude: event.longitude);
        yield WeatherLoaded(weather: weather);
      } catch (exception) {
          yield WeatherError(errorCode: exception.code);
      }
    }
  }



    WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);


}
