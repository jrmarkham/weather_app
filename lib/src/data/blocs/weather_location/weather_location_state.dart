part of 'weather_location_cubit.dart';

enum WeatherLocationStatus { init, loading, error, loaded }

class WeatherLocationState {
  final WeatherLocationStatus status;
  final AppWeatherLocationData? userWeatherLocation;
  final List<AppWeatherLocationData> weatherLocationList;

  const WeatherLocationState(this.status, {required this.weatherLocationList, this.userWeatherLocation});

  static WeatherLocationState init() => const WeatherLocationState(WeatherLocationStatus.init, weatherLocationList: []);

  WeatherLocationState copyWith(WeatherLocationStatus updateStatus,
          {AppWeatherLocationData? updateUserWeatherLocation, List<AppWeatherLocationData>? updateWeatherLocationList}) =>
      WeatherLocationState(updateStatus,
          userWeatherLocation: updateUserWeatherLocation ?? userWeatherLocation,
          weatherLocationList: updateWeatherLocationList ?? weatherLocationList);
}
