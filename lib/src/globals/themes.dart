import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTheme = ThemeData(
  useMaterial3: true,

// Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    background: Colors.blue[50],
    brightness: Brightness.light,
  ),

// Define the default `TextTheme`. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    titleLarge: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 32,
    ),
    titleMedium: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 24,
    ),
    titleSmall: GoogleFonts.aboreto(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontSize: 18,
    ),
    bodyLarge: GoogleFonts.roboto(fontSize: 24),
    bodyMedium: GoogleFonts.roboto(fontSize: 16),
    bodySmall: GoogleFonts.roboto(fontSize: 12),
  ),
);
