// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class CheckInternetCubit extends Cubit<ConnectivityResult> {
  CheckInternetCubit() : super(ConnectivityResult.none) {
    _startCheckInternetListener();
  }

  _startCheckInternetListener() async {
    emit(await Connectivity().checkConnectivity());

    // Listen for updates

    Connectivity().onConnectivityChanged.listen((ConnectivityResult newResults) {
      emit(newResults);
    });
  }
}
