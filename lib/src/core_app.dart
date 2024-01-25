import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/blocs/check_internet/check_internet_cubit.dart';

import 'data/blocs/navigation/navigation_cubit.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/offline_screen.dart';
import 'ui/screens/search_screen.dart';
import 'ui/screens/setting_screen.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<CheckInternetCubit, ConnectivityResult>(
      bloc: BlocProvider.of<CheckInternetCubit>(context),
      builder: (BuildContext context, ConnectivityResult state) {
        debugPrint('ConnectivityResult state $state');

        final bool isConnected = state != ConnectivityResult.none;
        return isConnected
            ? BlocBuilder<NavigationCubit, NavScreenStatus>(
                bloc: BlocProvider.of<NavigationCubit>(context),
                builder: (BuildContext context, NavScreenStatus navState) => Navigator(
                        // transitionDelegate:
                        pages: <MaterialPage<dynamic>>[
                          if (navState == NavScreenStatus.home) MaterialPage<dynamic>(child: HomeScreen(theme)),
                          if (navState == NavScreenStatus.search) MaterialPage<dynamic>(child: SearchScreen(theme)),
                          if (navState == NavScreenStatus.setting) MaterialPage<dynamic>(child: SettingScreen(theme)),
                        ],
                        onPopPage: (Route<dynamic> route, dynamic result) {
                          return route.didPop(result);
                        }))
            : OfflineScreen(theme);
      },
    );
  }
}
