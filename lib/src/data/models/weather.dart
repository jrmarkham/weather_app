import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BaseWeather extends Equatable {
  final String temperature;
  final String temperatureUnit;
  final String windSpeed;
  final String windDirection;
  final String forecast;
  final String details;

  BaseWeather(
      {@required this.temperature,@required this.temperatureUnit,
      @required this.windSpeed,
      @required this.windDirection,
      @required this.forecast,
      @required this.details});

  @override
  List<Object> get props =>
      [temperature, temperatureUnit, windSpeed, windDirection, forecast,
        details];
}
