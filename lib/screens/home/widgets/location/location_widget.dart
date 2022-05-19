import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/model/weather_model.dart';
import 'package:weather_app/screens/home/widgets/location/location_details.dart';
import 'package:weather_app/screens/home/widgets/location/weather_for_five_days.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key, required this.model}) : super(key: key);
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LocationDetails(model: model),
        WeatherForFiveDays(weatherForFiveDays: model.fiveDays),
      ],
    );
  }
}
