import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent),
    textTheme: const TextTheme(
      headline3: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
      headline4: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)
    )
  );
}