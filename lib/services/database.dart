import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/services/api_path.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  Future<Map<String, dynamic>> coordinateByLocationName(
      {required String name}) async {
    try {
      Uri url = Uri.parse(APIPath.coordinateByLocationNamePath(name: name));
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final List location = jsonDecode(response.body);
        if (location.isNotEmpty) {
          return location[0];
        }
      }
      throw Exception('No location found');
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fiveDaysWeatherForecast(
          {required String latitude, required String longitude}) async =>
      await _getData(APIPath.fiveDaysWeatherForecastPath(
          latitude: latitude, longitude: longitude));

  Future<Map<String, dynamic>> _getData(String path) async {
    try {
      final Uri url = Uri.parse(path);
      final http.Response response = await http.get(url);
      return jsonDecode(response.body);
    } catch (err) {
      rethrow;
    }
  }
}
