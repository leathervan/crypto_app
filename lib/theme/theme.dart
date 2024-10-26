import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 0.7,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white60,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white60,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.yellow, // Задает цвет для CircularProgressIndicator
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
      side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.yellow)),
    ),
  ),
);
