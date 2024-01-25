import 'package:flutter/material.dart';
import 'package:weather/src/data/models/app_weather_location.dart';

class WeatherCard extends StatelessWidget {
  final AppWeatherLocationData data;
  final ThemeData theme;
  const WeatherCard({required this.data, required this.theme, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5.0), borderRadius: BorderRadius.circular(45), color: Colors.white),
        child: Column(
          children: [
            Text(
              data.location.name,
              style: theme.textTheme.titleMedium,
              softWrap: true,
            ),
            Text(
              'lat: ${data.location.latitude} long: ${data.location.longitude} ',
              style: theme.textTheme.titleSmall,
              softWrap: true,
            ),
            Text(
              '${data.weather.temperature} ${data.weather.temperatureUnit}',
              style: theme.textTheme.bodyMedium,
              softWrap: true,
            ),
            Text(
              '${data.weather.shortForecast} ',
              style: theme.textTheme.bodyMedium,
              softWrap: true,
            ),
            Text(
              'Wind Speed: ${data.weather.windSpeed} Direction:${data.weather.windDirection}',
              style: theme.textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(height: 20.0),
            Text(
              data.weather.detailedForecast,
              style: theme.textTheme.bodySmall,
              softWrap: true,
            ),
          ],
        ),
      );
}
