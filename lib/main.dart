import 'package:clima/screens/home.dart';
import 'package:clima/theme/dark_theme.dart';
import 'package:clima/theme/ligth_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Clima());
}

class Clima extends StatelessWidget {
  const Clima({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      title: "Clima",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme(),
      theme: lightTheme(),
    );
  }
}