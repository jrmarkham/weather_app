import 'package:flutter/material.dart';

const String _mainFont = 'Roboto';

final mainTheme = ThemeData(
  useMaterial3: true,

// Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue,
    secondary: Colors.redAccent,
    background: Colors.lightBlue[200],
    brightness: Brightness.light,
  ),

// Define the default `TextTheme`. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 42,
      fontFamily: _mainFont,
      fontWeight: FontWeight.bold,
    ),
// ···
    titleLarge: TextStyle(
      fontFamily: _mainFont,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),

    titleMedium: TextStyle(
      fontFamily: _mainFont,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleSmall: TextStyle(
      fontFamily: _mainFont,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyLarge: TextStyle(fontFamily: _mainFont, fontSize: 16),
    bodyMedium: TextStyle(fontFamily: _mainFont, fontSize: 12),

    bodySmall: TextStyle(fontFamily: _mainFont, fontSize: 10),
  ),
);
