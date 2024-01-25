// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BottomNavigationBar,
        BottomNavigationBarItem,
        BuildContext,
        Icon,
        Icons,
        MediaQuery,
        SafeArea,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/blocs/navigation/navigation_cubit.dart';

import '../../../globals.dart';

class MainScreenScaffold extends StatelessWidget {
  final Widget body;
  final bool showNav;

  const MainScreenScaffold({required this.body, this.showNav = true, super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final NavigationCubit navCubit = BlocProvider.of<NavigationCubit>(context);
    void updateNav(int idx) => BlocProvider.of<NavigationCubit>(context).updateNav(NavScreenStatus.values[idx]);

    return Scaffold(
        key: Globals.globalScaffoldKey,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          title: const Text(Globals.title),
          centerTitle: true,
        ),

        // backgroundColor: colorTransparent,
        body: SafeArea(
          child: SizedBox(width: mediaData.size.width, child: body),
        ),
        bottomNavigationBar: showNav
            ? BottomNavigationBar(items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home', backgroundColor: theme.colorScheme.secondary),
                BottomNavigationBarItem(icon: const Icon(Icons.search), label: 'Search', backgroundColor: theme.colorScheme.secondary),
                BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'Settings', backgroundColor: theme.colorScheme.secondary),
              ], currentIndex: navCubit.state.index, selectedItemColor: theme.colorScheme.primary, onTap: updateNav)
            : const SizedBox());
  }
}
