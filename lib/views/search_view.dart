import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('search'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: TextField(
              onSubmitted: (value) async{
                WeatherModel weatherModel =await
                    WeatherService(dio: Dio()).getCurrentWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  suffixIcon: const Icon(Icons.search),
                  label: const Text('search'),
                  hintText: 'enter to search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey))),
            ),
          ),
        ));
  }
}
