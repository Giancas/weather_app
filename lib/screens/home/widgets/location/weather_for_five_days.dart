import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForFiveDays extends StatelessWidget {
  const WeatherForFiveDays({Key? key, required this.weatherForFiveDays})
      : super(key: key);
  final List weatherForFiveDays;

  Widget formatText({required String title}) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      );

  Widget singleDayWidget(int index) {
    final String dayOfWeek = DateFormat('EEEE')
        .format(DateTime.parse(weatherForFiveDays[index]['dt_txt']));
    final String schedule = DateFormat('HH:mm')
        .format(DateTime.parse(weatherForFiveDays[index]['dt_txt']));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        formatText(title: dayOfWeek),
        Flexible(
          child: Row(
            children: [
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherForFiveDays[index]['weather'][0]['icon']}.png'),
              formatText(
                  title: weatherForFiveDays[index]['weather'][0]
                      ['description']),
            ],
          ),
        ),
        formatText(title: schedule),
        formatText(
            title:
                '${weatherForFiveDays[index]['main']['temp'].toInt().toString()}°C')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueAccent.shade100,
                Colors.blueAccent.shade200,
                Colors.blueAccent.shade400,
                Colors.blueAccent.shade700,
              ])),
      child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: weatherForFiveDays.length,
          itemBuilder: (_, index) => singleDayWidget(index)),
    );
  }
}
