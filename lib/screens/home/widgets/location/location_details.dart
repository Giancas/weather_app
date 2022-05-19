import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/model/weather_model.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key, required this.model}) : super(key: key);
  final WeatherModel model;
  Widget formatText({required String title, required double size}) => Text(
        title,
        style: TextStyle(fontSize: size, color: Colors.white),
        textAlign: TextAlign.center,
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formatText(title: model.name, size: 35),
        const SizedBox(height: 10),
        formatText(title: '${model.temp}°C', size: 50),
        formatText(title: model.description, size: 25),
        const SizedBox(height: 10),
        formatText(
            title:
                'MAX: ${model.tempMax.toInt()}°C MIN: ${model.tempMin.toInt()}°C',
            size: 25),
      ],
    );
  }
}
