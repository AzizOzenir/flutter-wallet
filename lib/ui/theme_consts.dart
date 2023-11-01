import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade300,
  cardColor: Colors.grey.shade100,
  textTheme: TextTheme(
    bodySmall: TextStyle(
        color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(
        color: Colors.grey.shade800, fontSize: 20, fontWeight: FontWeight.w300),
    bodyLarge: TextStyle(
        color: Colors.grey.shade800, fontSize: 24, fontWeight: FontWeight.w300),
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade700),
);

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade800,
    cardColor: Colors.grey.shade600,
    textTheme: TextTheme(
      bodySmall: TextStyle(
          color: Colors.grey.shade100,
          fontSize: 16,
          fontWeight: FontWeight.w300),
      bodyMedium: TextStyle(
          color: Colors.grey.shade100,
          fontSize: 20,
          fontWeight: FontWeight.w300),
      bodyLarge: TextStyle(
          color: Colors.grey.shade100,
          fontSize: 24,
          fontWeight: FontWeight.w300),
    ),
    iconTheme: IconThemeData(color: Colors.grey.shade100));

BorderRadius bRadius = BorderRadius.circular(8);
BorderRadius bRadiusSoft = BorderRadius.circular(16);

List<LinearGradient> gradients = [
  const LinearGradient(colors: <Color>[
    Color.fromARGB(255, 0, 225, 255),
    Color.fromARGB(255, 0, 38, 255),
    Color.fromARGB(255, 93, 0, 255),
  ], begin: Alignment.bottomRight, end: Alignment.topLeft),
  const LinearGradient(colors: <Color>[
    Color.fromARGB(255, 0, 225, 255),
    Color.fromARGB(255, 255, 17, 0),
    Color.fromARGB(255, 255, 153, 0),
  ], begin: Alignment.bottomRight, end: Alignment.topLeft),
  const LinearGradient(colors: <Color>[
    Color.fromARGB(255, 229, 255, 0),
    Color.fromARGB(255, 0, 38, 255),
    Color.fromARGB(255, 0, 38, 255),
  ], begin: Alignment.bottomRight, end: Alignment.topLeft)
];
