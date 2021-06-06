import 'package:flutter/material.dart';
import 'package:weather/src/data/models/weather.dart';

Widget weatherCard(BaseWeather weather) => Container(
  decoration: BoxDecoration(
    border: Border.all(
        color: Colors.blue, width: 5.0
      
    ), borderRadius: BorderRadius.circular(50)
    
    
  ),
  child: ListTile(
    title: Center(
      child: Text(
        '${weather.forecast} ${weather.temperature} ${weather.temperatureUnit}',
        style: TextStyle(color: Colors.blue, fontSize: 15.0),
        softWrap: true,
      ),
    ),
    subtitle: Center(
      child: Column(
        children: [
          Text(
              'Wind Speed: ${weather.windSpeed} Direction:${weather.windDirection}'),
          SizedBox(height: 20.0),
          Text(weather.details)
        ],
      ),
    ),
    contentPadding: const EdgeInsets.all(25.0),
  ),
);
