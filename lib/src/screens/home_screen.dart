import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/blocs/ui/ui_bloc.dart';
import 'package:weather/src/data/blocs/weather/weather_bloc.dart';
import 'package:weather/src/globals.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UIBloc _uiBloc = BlocProvider.of<UIBloc>(context);
    final Function _searchFunction = () => _uiBloc.updateUI(NavScreen.search);
    final Function _worldFunction = () => _uiBloc.updateUI(NavScreen.world);
    final Function _refreshFunction = () => _uiBloc.refreshWeather();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text('Home', style: TextStyle(fontSize: 35.0)),
            BlocBuilder<WeatherBloc, WeatherBlocState>(
              bloc: BlocProvider.of<WeatherBloc>(context),

                builder: (BuildContext context, WeatherBlocState state) {
                return state.baseWeather == null
                  ? CircularProgressIndicator()
                  : Column(
                    children: [
                      weatherCard(state.baseWeather),

                      SizedBox(height: 20.0),
                      ElevatedButton(onPressed: _refreshFunction, child: Text
                        ('Refresh'))
                    ],
                  );
    },),
Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(onPressed: _searchFunction, child: Text('Search')),
                ElevatedButton(onPressed: _worldFunction, child: Text('World')),
              ],
            )
          ],
        ),
      ),
    );
  }
}