import 'package:dio/dio.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather() async {
    Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=666ad2f6cc3d4d6baf4141302242710&q=London&days=1');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
