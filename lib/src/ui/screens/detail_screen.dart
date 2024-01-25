import 'package:flutter/material.dart';
import 'scaffolds/main_screen_scaffold.dart';

class SettingScreen extends StatelessWidget {
  final ThemeData theme;
  const SettingScreen(this.theme, {super.key});

  @override
  Widget build(BuildContext context) => const MainScreenScaffold(
        body: Column(
          children: [Text("settings")],
        ),
      );
}
