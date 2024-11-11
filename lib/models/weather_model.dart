import 'package:weather_app_v2/widgets/weather_info_body.dart';

class WeatherModel {
  final String city;
  final DateTime time;
  final String image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.city,
    required this.time,
    required this.image,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        city: json['location']['name'],
        time:DateTime.parse( json['location']['localtime']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
