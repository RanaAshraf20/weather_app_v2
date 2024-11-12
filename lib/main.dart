import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_v2/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: getWeatherThemeColor(
                BlocProvider.of<GetCurrentWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              )),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: getWeatherThemeColor(
                    BlocProvider.of<GetCurrentWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          ),
        );
      }),
    );
  }
}

MaterialColor getWeatherThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;

    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Blizzard':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.indigo;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    default:
      return Colors.blue; // fallback color
  }
}
