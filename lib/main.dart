import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/core_app.dart';
import 'package:weather/src/data/blocs/ui/ui_bloc.dart';
import 'package:weather/src/data/blocs/weather/weather_bloc.dart';
import 'package:weather/src/globals.dart';
Future<void> main() async {
  Globals.initGlobal().then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Globals.title,
        home: MultiBlocProvider(providers: [
          BlocProvider<UIBloc>(create: (BuildContext context) => UIBloc()),
          BlocProvider<WeatherBloc>(
              create: (BuildContext context) => WeatherBloc()),
        ], child: CoreApp())));
  });
}
