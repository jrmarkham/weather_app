part of 'ui_bloc.dart';

abstract class UIBlocState extends Equatable {
  final NavScreen navScreen;


  UIBlocState(UIBlocState state, {NavScreen navScreen})
      : this.navScreen = navScreen ?? state?.navScreen ?? NavScreen.home;

  @override
  List<Object> get props => [navScreen];
}

class UIBlocStateInitial extends UIBlocState {
  UIBlocStateInitial(UIBlocState state) : super(state);

  @override
  List<Object> get props => [];
}

class UIBlocStateUpdate extends UIBlocState {
  final UIBlocState state;
  final NavScreen navScreen;
  UIBlocStateUpdate(this.state, {@required this.navScreen}) :
        super(state);

  @override
  List<Object> get props => [state, navScreen];
}


class UIBlocStateRefreshWeather extends UIBlocState {
  final UIBlocState state;
  UIBlocStateRefreshWeather(this.state) :
        super(state);

  @override
  List<Object> get props => [state];
}