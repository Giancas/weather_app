import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: HomePage.create(context),
    );
  }
}
