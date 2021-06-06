import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/src/data/models/weather.dart';
import 'package:weather/src/data/services/weather_services.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocStateInitial(null));

  // set up service
  final BaseWeatherServices _weatherServices = WeatherServices();
  @override
  Stream<WeatherBlocState> mapEventToState(
    WeatherBlocEvent event,
  ) async* {
    if (event is WeatherBlocEventInit) {
      final double latitude = 40.7143;
      final double longitude = -74.0060;

      final BaseWeather baseWeather = await _weatherServices.getWeatherDataLatLong(
          latitude: latitude.toString(),
          longitude: longitude.toString());

      yield WeatherBlocStateUpdate(state, baseWeather: baseWeather);
    }
  }

  getHomeWeather() => add(WeatherBlocEventInit());
}
