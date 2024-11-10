import 'package:flutter/material.dart';
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
      body: const WeatherInfoBody(),
    );
  }
}
