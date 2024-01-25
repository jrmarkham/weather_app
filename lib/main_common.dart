import 'dart:io';

import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart' show BuildContext, FlutterError, FlutterErrorDetails, MaterialApp, debugPrint, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/core_app.dart';
import 'src/data/blocs/check_internet/check_internet_cubit.dart';
import 'src/data/blocs/navigation/navigation_cubit.dart';
import 'src/data/blocs/weather_location/weather_location_cubit.dart';
import 'src/globals.dart';
import 'src/globals/themes.dart';

Future<void> mainCommon() async {
  debugPrint('configType ${Globals.appConfig}');

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      if (kReleaseMode) exit(1);
    };
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        home: MultiBlocProvider(providers: [
          BlocProvider<CheckInternetCubit>(create: (BuildContext context) => CheckInternetCubit()),
          BlocProvider<NavigationCubit>(create: (BuildContext context) => NavigationCubit()),
          BlocProvider<WeatherLocationCubit>(create: (BuildContext context) => WeatherLocationCubit())
        ], child: const CoreApp())));
  }, onError: (dynamic error, dynamic stackTrace) {
    debugPrint(' onError main error: $error stackTrace: $stackTrace');
  });
}
