import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_weather.g.dart';

@JsonSerializable(createToJson: false)
@immutable
class AppWeatherData {
  final int temperature;
  final String temperatureUnit;
  final String windSpeed;
  final String windDirection;
  final String shortForecast;
  final String detailedForecast;
//  final String icon;

  const AppWeatherData(
      {required this.temperature,
      required this.temperatureUnit,
      required this.windSpeed,
      required this.windDirection,
      required this.shortForecast,
      required this.detailedForecast});

  factory AppWeatherData.fromJson(Map<String, dynamic> json) => _$AppWeatherDataFromJson(json);
}
