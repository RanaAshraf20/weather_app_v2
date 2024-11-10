
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'beni-suef',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
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
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
                
              
                ),
            const Text('17',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            const Column(
              children: [Text('maxTemp: 17'), Text('minTemp: 19')],
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const Text('light',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32))
      ],
    );
  }
}
