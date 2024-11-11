import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/services/weather_service.dart';

class GetCurrentWeatherCubit extends Cubit<WeatherState> {
  GetCurrentWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailerState(failerMessage: e.toString()));
    }
  }
}
