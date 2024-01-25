import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/weather_location/weather_location_cubit.dart';
import '../widgets/weather_card.dart';
import 'scaffolds/main_screen_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final ThemeData theme;

  const HomeScreen(this.theme, {super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherLocationCubit weatherLocationCubit = BlocProvider.of<WeatherLocationCubit>(context);

    return BlocBuilder<WeatherLocationCubit, WeatherLocationState>(
      bloc: weatherLocationCubit,
      builder: (BuildContext context, WeatherLocationState state) {
        if (state.status == WeatherLocationStatus.init) {
          weatherLocationCubit.requestLocation();
        }

        return MainScreenScaffold(
            body: Column(children: [
              if (state.status == WeatherLocationStatus.loaded) ...[WeatherCard(state.userWeatherLocation!)],
              if (state.status == WeatherLocationStatus.error) ...[const Text('service error no data today')],
              if (state.status == WeatherLocationStatus.init || state.status == WeatherLocationStatus.loading) ...[const Text('loading data')],
            ]),
            showNav: state.status == WeatherLocationStatus.loaded);
      },
    );
  }
}
