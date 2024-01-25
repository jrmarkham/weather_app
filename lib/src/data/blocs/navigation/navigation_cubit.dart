import 'package:flutter_bloc/flutter_bloc.dart';

enum NavScreenStatus { home, search, setting }

class NavigationCubit extends Cubit<NavScreenStatus> {
  NavigationCubit() : super(NavScreenStatus.home);

  updateNav(NavScreenStatus updateStatus) => emit(updateStatus);
}
