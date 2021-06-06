part of 'ui_bloc.dart';

abstract class UIBlocEvent extends Equatable {
  const UIBlocEvent();
}

class UIBlocEventUpdate extends UIBlocEvent {
  final NavScreen navScreen;
  UIBlocEventUpdate(this.navScreen);

  @override
  List<Object> get props => [navScreen];
}

class UIBlocEventRefreshWeather extends UIBlocEvent {

  @override
  List<Object> get props => [];
}