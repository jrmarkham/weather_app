import 'package:flutter/material.dart';
import 'package:weather/src/data/models/app_weather_location.dart';

class WeatherMiniCard extends StatelessWidget {
  final AppWeatherLocationData data;
  final ThemeData theme;
  const WeatherMiniCard({required this.data, required this.theme, super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5.0), borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: ListTile(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.location.name,
                style: theme.textTheme.bodyMedium,
                softWrap: true,
              ),
              Text(
                '${data.weather.temperature} ${data.weather.temperatureUnit}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ));
}
