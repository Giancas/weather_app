import 'dart:async';

import 'package:weather_app/screens/home/model/weather_model.dart';
import 'package:weather_app/services/database.dart';

class WeatherBloc {
  DatabaseService database = DatabaseService.instance;

  final StreamController<WeatherModel> _streamController =
      StreamController<WeatherModel>();

  Stream<WeatherModel> get modelStream => _streamController.stream;

  Future<void> dispose() => _streamController.close();

  Future<void> searchLocation(String locationName) async {
    try {
      final Map<String, dynamic> locationCoordinate =
          await database.coordinateByLocationName(name: locationName);
      final Map<String, dynamic> currentWeatherDataLocation =
          await database.fiveDaysWeatherForecast(
              latitude: locationCoordinate['lat'].toString(),
              longitude: locationCoordinate['lon'].toString());
      _streamController.add(WeatherModel.fromMap(currentWeatherDataLocation));
    } catch (err) {
      rethrow;
    }
  }
}
