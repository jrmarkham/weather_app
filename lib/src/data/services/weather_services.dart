import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/models/weather.dart';

const String API_KEY = 'e69862ee95de83396ff097cd01ba6dfb';

abstract class BaseWeatherServices {
  Future<BaseWeather> getWeatherDataLatLong(
      {@required String latitude, @required String longitude});
}

class WeatherServices extends BaseWeatherServices {
  // static singleton
  static final WeatherServices _instance = WeatherServices.internal();

  factory WeatherServices() => _instance;

  WeatherServices.internal();

  Future<BaseWeather> getWeatherDataLatLong(
      {@required String latitude, @required String longitude}) async {

    final String url = 'https://api.weather.gov/points/$latitude,$longitude';
    final http.Response response = await http.get(Uri.parse(url));
    final Map<String, dynamic> responseJson = json.decode(response.body);
    // get forecast url
    final String forecast = responseJson['properties']['forecast'];

    //  return forecastData as model


    return forecast == null ? null : _getForecastDataFromURL(forecast);
  }

  Future<BaseWeather> _getForecastDataFromURL (String url) async{
    final http.Response forecastResponse = await http.get(Uri.parse(url));
    final Map<String, dynamic> forecastJson = json.decode(forecastResponse.body);
    // get specific data for current forecast
    final Map<String, dynamic> forecastData = forecastJson['properties']['periods'][0];

    //  return forecastData as model

    return BaseWeather(
        temperature: forecastData["temperature"].toString(),
        temperatureUnit: forecastData["temperatureUnit"].toString(),
        windSpeed: forecastData["windSpeed"].toString(),
        windDirection: forecastData["windDirection"].toString(),
        forecast: forecastData["shortForecast"].toString(),
        details: forecastData["detailedForecast"].toString());

  }
}
