import 'package:flutter/material.dart';

const primaryColor = Color(0xFF5C6BC0);       // Indigo 400
const secondaryColor = Color(0xFF64B5F6);     // Light Blue 300
const backgroundLight = Color(0xFFF5F7FA);    // Presque blanc doux
const surfaceLight = Color(0xFFFFFFFF);       // Blanc pur
const backgroundDark = Color(0xFF121212);     // Très sombre
const surfaceDark = Color(0xFF1E1E1E);        // Gris anthracite
const accentColor = Color(0xFF81D4FA);        // Cyan clair

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundLight,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    background: backgroundLight,
    surface: surfaceLight,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.black,
    onSurface: Colors.black87,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 2,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
  cardColor: surfaceLight,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: backgroundDark,
  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    secondary: accentColor,
    background: backgroundDark,
    surface: surfaceDark,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white70,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: surfaceDark,
    foregroundColor: Colors.white,
    elevation: 2,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
  cardColor: surfaceDark,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Color(0xFF2A2A2A),
  ),
);
