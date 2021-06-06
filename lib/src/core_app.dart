import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/blocs/ui/ui_bloc.dart';
import 'package:weather/src/data/blocs/weather/weather_bloc.dart';
import 'package:weather/src/globals.dart';
import 'package:weather/src/screens/home_screen.dart';
import 'package:weather/src/screens/search_screen.dart';
import 'package:weather/src/screens/world_screen.dart';

class CoreApp extends StatefulWidget {
  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  UIBloc _uiBloc;
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    // init bloc for ui
    _uiBloc = BlocProvider.of<UIBloc>(context);
    // init bloc to handle the weather
    _weatherBloc = BlocProvider.of<WeatherBloc>(context)..getHomeWeather();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

      MultiBlocListener(
          listeners: [
            BlocListener<UIBloc, UIBlocState>(
                bloc: _uiBloc,
                listener: (BuildContext context,
                    UIBlocState state) {
                  debugPrint('UIBloc Listener state :: ${state.toString()} ');
                  if(state is UIBlocStateRefreshWeather){
                    _weatherBloc.getHomeWeather();
                  }

                }),
            BlocListener<WeatherBloc, WeatherBlocState>(
                bloc: _weatherBloc,
                listener: (BuildContext context,
                    WeatherBlocState state) {
                  debugPrint('WeatherBloc Listener state :: ${state.toString()}');
                })
          ],

          child: Scaffold(
              appBar: AppBar(
                title: Text(Globals.title),
              ),
              body: BlocBuilder<UIBloc, UIBlocState>(

                bloc: _uiBloc,
                builder: (BuildContext context, UIBlocState state) {
                  return _getScreen(state.navScreen);
                },
              )
          ));
  }

  Widget _getScreen(NavScreen navScreen) {
    switch (navScreen) {
      case NavScreen.search:
        return SearchScreen();
      case NavScreen.world:
        return WorldScreen();
      case NavScreen.home:
      default:
        return HomeScreen();
    }
  }

}
