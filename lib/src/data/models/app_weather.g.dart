// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppWeatherData _$AppWeatherDataFromJson(Map<String, dynamic> json) => AppWeatherData(
      temperature: json['temperature'] as int,
      temperatureUnit: json['temperatureUnit'] as String,
      windSpeed: json['windSpeed'] as String,
      windDirection: json['windDirection'] as String,
      shortForecast: json['shortForecast'] as String,
      detailedForecast: json['detailedForecast'] as String,
    );
