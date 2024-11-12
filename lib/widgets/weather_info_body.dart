import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/main.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getWeatherThemeColor(weatherModel.weatherCondition)[200]!,
            getWeatherThemeColor(weatherModel.weatherCondition)[500]!,
            getWeatherThemeColor(weatherModel.weatherCondition)[50]!,
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            'updated at:${weatherModel.time.hour}:${weatherModel.time.minute}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl: weatherModel.image.contains('https:')
                    ? weatherModel.image
                    : 'https:${weatherModel.image}',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(weatherModel.avgTemp.round().toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 26)),
              Column(
                children: [
                  Text('maxTemp: ${weatherModel.maxTemp.round()}'),
                  Text('minTemp: ${weatherModel.minTemp.round()}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Text(weatherModel.weatherCondition,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32))
        ],
      ),
    );
  }
}

DateTime dateTime({required String time}) {
  return DateTime.parse(time);
}
