import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/models/app_config.dart';
export 'package:weather/src/globals/enums.dart';
export 'package:weather/src/ui/widgets/weather_card.dart';

class Globals {
  static late final MediaQueryData mediaData;

  static late final AppConfig appConfig;

  static const String title = 'The Weather App';

  static final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  static Future<void> initConfigurations() async {
    // // app config
    String? appData = await rootBundle.loadString('assets/configs/config.json');
    appConfig = AppConfig.fromJson(json.decode(appData));

    return;
  }

  static Future<Map<String, dynamic>> getData(String path) async {
    String data = await rootBundle.loadString(path);
    return json.decode(data);
  }
}
