import 'package:flutter/material.dart';
import 'package:weather/src/data/models/app_weather_location.dart';

class WeatherCard extends StatelessWidget {
  final AppWeatherLocationData data;

  const WeatherCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5.0), borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Column(
          children: [
            Text(
              data.location.name,
              style: const TextStyle(color: Colors.blue, fontSize: 35.0),
              softWrap: true,
            ),
            Text(
              'lat: ${data.location.latitude} long: ${data.location.longitude} ',
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
              softWrap: true,
            ),
            Text(
              '${data.weather.temperature} ${data.weather.temperatureUnit}',
              style: const TextStyle(color: Colors.blue, fontSize: 25.0),
              softWrap: true,
            ),
            Text(
              '${data.weather.shortForecast} ',
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
              softWrap: true,
            ),
            Text(
              'Wind Speed: ${data.weather.windSpeed} Direction:${data.weather.windDirection}',
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
              softWrap: true,
            ),
            const SizedBox(height: 20.0),
            Text(
              data.weather.detailedForecast,
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
              softWrap: true,
            ),
          ],
        ),
      );
}
