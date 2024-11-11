import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel.city,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        const Text(
          'updated at: 20:40',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CachedNetworkImage(
                imageUrl: weatherModel.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(weatherModel.avgTemp.round().toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
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
    );
  }
}
