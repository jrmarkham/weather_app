import 'package:flutter/material.dart';
import 'scaffolds/main_screen_scaffold.dart';

class OfflineScreen extends StatelessWidget {
  final ThemeData theme;
  const OfflineScreen(this.theme, {super.key});
  @override
  Widget build(BuildContext context) => const MainScreenScaffold(
        body: Column(
          children: [Text('you\'re offline')],
        ),
        showNav: false,
      );
}
