import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_v2/cubits/get_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_v2/views/search_view.dart';
import 'package:weather_app_v2/widgets/no_weather_body.dart';
import 'package:weather_app_v2/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is WeatherFailerState) {
            return Text(state.failerMessage);
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody();
          } else {
            return const NoWeatherBody();
          }
        }));
  }
}
