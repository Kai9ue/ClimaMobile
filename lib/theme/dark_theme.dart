import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromARGB(255, 60, 56, 94),
    appBarTheme: AppBarTheme(color: Colors.blueGrey[750]),
    textTheme: const TextTheme(
      headline3: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
      headline4: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)
    )
  );
}