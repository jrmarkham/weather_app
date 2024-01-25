import 'app_location.dart';
import 'app_weather.dart';

class AppWeatherLocationData {
  final AppLocationData location;
  final AppWeatherData weather;

  const AppWeatherLocationData({required this.location, required this.weather});
}
