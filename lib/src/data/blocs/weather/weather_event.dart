part of 'weather_bloc.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();
}

class WeatherBlocEventInit extends WeatherBlocEvent {
  @override
  List<Object> get props => [];
}

