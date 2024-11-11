import 'package:dio/dio.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather() async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=666ad2f6cc3d4d6baf4141302242710&q=London&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errMessage = e.response?.data['error']['message'] ??
          'oops there is an error, try later!';
      throw Exception(errMessage);
    }catch (e){
       throw Exception('oops there is an error, try later!');
    }
   
  }
}
