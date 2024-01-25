import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/models/app_weather.dart';
import 'package:weather/src/globals.dart';

abstract class BaseWeatherServices {
  Future<AppWeatherData?> getWeatherDataLatLong({required String latitude, required String longitude});
}

class WeatherServices extends BaseWeatherServices {
  // static singleton
  static final WeatherServices _instance = WeatherServices.internal();

  factory WeatherServices() => _instance;

  WeatherServices.internal();

  @override
  Future<AppWeatherData?> getWeatherDataLatLong({required String latitude, required String longitude}) async {
    final String url = '${Globals.appConfig.api}$latitude,$longitude';

    try {
      final http.Response response = await http.get(Uri.parse(url));
      final Map<String, dynamic> responseJson = json.decode(response.body);

      if (response.statusCode != 200) {
        return null;
      }

      // get forecast url
      final String forecast = responseJson['properties']['forecast'];

      if (responseJson.isNotEmpty) {
        return _getForecastDataFromURL(forecast);
      }

      return null;
    } on Exception catch (e) {
      debugPrint('getWeatherDataLatLong  error $e');
      return null;
    }
    //  return forecastData as model
  }

  Future<AppWeatherData?> _getForecastDataFromURL(String url) async {
    try {
      final http.Response forecastResponse = await http.get(Uri.parse(url));
      if (forecastResponse.statusCode == 200) {
        //  return forecastData as model

        return AppWeatherData.fromJson(json.decode(forecastResponse.body)['properties']['periods'][0]);
      }
      debugPrint('_getForecastDataFromURL  error status code ${forecastResponse.statusCode}');
      return null;
    } on Exception catch (e) {
      debugPrint('_getForecastDataFromURL  error $e');
      return null;
    }
  }
}
