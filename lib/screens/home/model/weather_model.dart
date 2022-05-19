class WeatherModel {
  WeatherModel({
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.temp,
    required this.iconName,
    required this.tempMin,
    required this.tempMax,
    required this.fiveDays,
  });
  final String name;
  final String description;
  final String iconName;
  final double latitude;
  final double longitude;
  final double temp;
  final double tempMin;
  final double tempMax;
  final List fiveDays;

  factory WeatherModel.fromMap(Map<String, dynamic> data) {
    return WeatherModel(
      name: data['city']['name'],
      description: data['list'][0]['weather'][0]['description'],
      iconName: data['list'][0]['weather'][0]['icon'],
      latitude: data['city']['coord']['lat'],
      longitude: data['city']['coord']['lon'],
      temp: data['list'][0]['main']['temp'],
      tempMin: data['list'][0]['main']['temp_min'],
      tempMax: data['list'][0]['main']['temp_max'],
      fiveDays: data['list'],
    );
  }
}
