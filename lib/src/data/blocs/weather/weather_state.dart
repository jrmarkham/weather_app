part of 'weather_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  final BaseWeather baseWeather;


  WeatherBlocState(WeatherBlocState state, {BaseWeather baseWeather})
      : this.baseWeather = baseWeather ?? state?.baseWeather;

  @override
  List<Object> get props => [baseWeather];
}

class WeatherBlocStateInitial extends WeatherBlocState {
  WeatherBlocStateInitial(WeatherBlocState state) : super(state);

  @override
  List<Object> get props => [];
}

class WeatherBlocStateLoading extends WeatherBlocState {
  WeatherBlocStateLoading(WeatherBlocState state) : super(state);

  @override
  List<Object> get props => [];
}


class WeatherBlocStateUpdate extends WeatherBlocState {
  final WeatherBlocState state;
  final BaseWeather baseWeather;
  WeatherBlocStateUpdate(this.state, {@required this.baseWeather}) :
        super(state);

  @override
  List<Object> get props => [state, baseWeather];
}