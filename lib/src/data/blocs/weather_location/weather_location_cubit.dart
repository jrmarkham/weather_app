import 'package:fl_location/fl_location.dart' as fll;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/models/app_weather.dart';

import '../../models/app_location.dart';
import '../../models/app_weather_location.dart';
import '../../services/weather_services.dart';

part 'weather_location_state.dart';

const String _defaultLatitude = '40.7143';
const String _defaultLongitude = '-74.0060';

class WeatherLocationCubit extends Cubit<WeatherLocationState> {
  final BaseWeatherServices _weatherServices = WeatherServices();

  WeatherLocationCubit() : super(WeatherLocationState.init());

  Future<void> requestLocation() async {
    debugPrint('requestLocation ');
    emit(state.copyWith(WeatherLocationStatus.loading));

    if (!await fll.FlLocation.isLocationServicesEnabled) {
      // Location services are disabled.

      debugPrint('service down');
      emit(state.copyWith(WeatherLocationStatus.error));

      return;
    }

    fll.LocationPermission locationPermission = await fll.FlLocation.checkLocationPermission();
    if (locationPermission == fll.LocationPermission.deniedForever) {
      _runNewYorkDefault();
      return;
    } else if (locationPermission == fll.LocationPermission.denied) {
      // Ask the user for location permission.
      locationPermission = await fll.FlLocation.requestLocationPermission();
      if (locationPermission == fll.LocationPermission.denied || locationPermission == fll.LocationPermission.deniedForever) {
        _runNewYorkDefault();

        return;
      }
    }

    const timeLimit = Duration(seconds: 10);

    final fll.Location location = await fll.FlLocation.getLocation(timeLimit: timeLimit);

    //
    final AppWeatherData? weatherData =
        await _weatherServices.getWeatherDataLatLong(latitude: location.latitude.toString(), longitude: location.longitude.toString());
    //
    //
    debugPrint('weatherData ${weatherData?.temperature.toString()}');
    //
    if (weatherData == null) {
      emit(state.copyWith(WeatherLocationStatus.error));
      return;
    }

    // Android chokes on this plugin
    // final result = await LocationPlus.getCurrentLocation();
    // final String name = result['locality'];

    final AppWeatherLocationData mainData = AppWeatherLocationData(
        location: AppLocationData(name: 'Home', latitude: location.latitude.toString(), longitude: location.longitude.toString()),
        weather: weatherData);

    emit(state.copyWith(WeatherLocationStatus.loaded, updateUserWeatherLocation: mainData, updateWeatherLocationList: [mainData]));
  }

  Future<void> addLocation(AppLocationData locationData) async {
    debugPrint('add Search data  ');

    final AppWeatherData? weatherData =
        await _weatherServices.getWeatherDataLatLong(latitude: locationData.latitude, longitude: locationData.longitude);
    if (weatherData == null) {
      // handel error
      debugPrint('weatherData data error data  ');
    }

    final List<AppWeatherLocationData> newList = state.weatherLocationList.toList();

    newList.add(AppWeatherLocationData(location: locationData, weather: weatherData!));

    emit(state.copyWith(WeatherLocationStatus.loaded, updateWeatherLocationList: List<AppWeatherLocationData>.unmodifiable(newList.toList())));
  }

  Future<void> _runNewYorkDefault() async {
    debugPrint('location data default to New York');
    final AppWeatherData? weatherData = await _weatherServices.getWeatherDataLatLong(latitude: _defaultLatitude, longitude: _defaultLongitude);

    weatherData == null
        ? emit(state.copyWith(WeatherLocationStatus.error))
        : emit(state.copyWith(WeatherLocationStatus.loaded,
            updateUserWeatherLocation: AppWeatherLocationData(
                location: const AppLocationData(name: 'New York', latitude: _defaultLatitude, longitude: _defaultLongitude), weather: weatherData)));
  }
}
