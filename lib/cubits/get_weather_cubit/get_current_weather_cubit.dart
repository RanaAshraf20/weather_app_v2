import 'package:bloc/bloc.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_state.dart';

class GetCurrentWeatherCubit extends Cubit<WeatherState>{
  GetCurrentWeatherCubit():super(NoWeatherState());

}