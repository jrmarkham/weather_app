import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
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
    emit(state.copyWith(WeatherLocationStatus.loading));

    final GeolocatorPlatform geoPlat = GeolocatorPlatform.instance;

    if (!await geoPlat.isLocationServiceEnabled()) {
      // Location services are disabled.
      debugPrint('service down');
      emit(state.copyWith(WeatherLocationStatus.error));

      return;
    }

    var permission = await geoPlat.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      _runNewYorkDefault();
      return;
    } else if (permission == LocationPermission.denied) {
      // Ask the user for location permission.
      permission = await geoPlat.requestPermission();
      if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
        _runNewYorkDefault();

        return;
      }
    }

    final Position location = await geoPlat.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
    ));

    final AppWeatherData? weatherData =
        await _weatherServices.getWeatherDataLatLong(latitude: location.latitude.toString(), longitude: location.longitude.toString());

    if (weatherData == null) {
      emit(state.copyWith(WeatherLocationStatus.error));
      return;
    }

    // get proper name
    final List<Placemark> places = await placemarkFromCoordinates(location.latitude, location.longitude);

    final String home = places.first.locality ?? 'Home';

    final AppWeatherLocationData mainData = AppWeatherLocationData(
        location: AppLocationData(name: home, latitude: location.latitude.toString(), longitude: location.longitude.toString()),
        weather: weatherData);

    emit(state.copyWith(WeatherLocationStatus.loaded, updateUserWeatherLocation: mainData));
  }

  Future<void> addLocation(AppLocationData locationData) async {
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
    final AppWeatherData? weatherData = await _weatherServices.getWeatherDataLatLong(latitude: _defaultLatitude, longitude: _defaultLongitude);

    weatherData == null
        ? emit(state.copyWith(WeatherLocationStatus.error))
        : emit(state.copyWith(WeatherLocationStatus.loaded,
            updateUserWeatherLocation: AppWeatherLocationData(
                location: const AppLocationData(name: 'New York', latitude: _defaultLatitude, longitude: _defaultLongitude), weather: weatherData)));
  }
}
