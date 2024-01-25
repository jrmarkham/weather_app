import 'package:flutter/material.dart';
import 'scaffolds/main_screen_scaffold.dart';

class OfflineScreen extends StatelessWidget {
  final ThemeData theme;
  const OfflineScreen(this.theme, {super.key});
  @override
  Widget build(BuildContext context) => MainScreenScaffold(
        body: Column(
          children: [
            Text('You\'re Offline', style: theme.textTheme.titleLarge?.copyWith(color: Colors.red)),
          ],
        ),
        showNav: false,
      );
}
