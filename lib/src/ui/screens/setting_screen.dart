import 'package:flutter/material.dart';
import 'scaffolds/main_screen_scaffold.dart';

class SettingScreen extends StatelessWidget {
  final ThemeData theme;
  const SettingScreen(this.theme, {super.key});

  @override
  Widget build(BuildContext context) => MainScreenScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Settings', style: theme.textTheme.titleLarge), Text('got nuthin\' yet', style: theme.textTheme.bodyMedium)],
        ),
      );
}
