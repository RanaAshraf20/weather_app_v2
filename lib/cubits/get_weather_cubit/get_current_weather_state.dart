import 'package:weather_app_v2/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailerState extends WeatherState {
  final String failerMessage;

  WeatherFailerState({required this.failerMessage});
}
