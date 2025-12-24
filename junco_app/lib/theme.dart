import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF2bee6c);
  static const Color backgroundLight = Color(0xFFf6f8f6);
  static const Color backgroundDark = Color(0xFF102216);
  static const Color surfaceDark = Color(0xFF1a3022);
  static const Color cardDark = Color(0xFF162b1d);
  static const Color surfaceLight = Colors.white;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: primary,
      surface: surfaceLight,
      background: backgroundLight,
      onPrimary: backgroundDark,
      onSurface: Color(0xFF0F172A), // Slate 900
    ),
    textTheme: GoogleFonts.manropeTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: const Color(0xFF0F172A),
      displayColor: const Color(0xFF0F172A),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      surface: surfaceDark,
      background: backgroundDark,
      onPrimary: backgroundDark,
      onSurface: Colors.white,
    ),
    textTheme: GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
