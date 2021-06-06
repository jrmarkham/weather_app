import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:weather/src/globals.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UIBloc extends Bloc<UIBlocEvent, UIBlocState> {
  UIBloc() : super(UIBlocStateInitial(null));

  @override
  Stream<UIBlocState> mapEventToState(
    UIBlocEvent event,
  ) async* {
    if(event is UIBlocEventUpdate) {
      yield UIBlocStateUpdate(state,
          navScreen: event.navScreen ?? state.navScreen);
    }

    if(event is UIBlocEventRefreshWeather) {
      yield UIBlocStateRefreshWeather(state);
    }
  }

  void updateUI(NavScreen navScreen) => add(UIBlocEventUpdate(navScreen));
  void refreshWeather() => add(UIBlocEventRefreshWeather());
}
