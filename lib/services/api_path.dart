class APIPath {
  const APIPath._();

  static const String _APIKey = '9b5238baa5065d367a99e1e92532c70f';

  static String coordinateByLocationNamePath({required String name}) =>
      'http://api.openweathermap.org/geo/1.0/direct?q=$name,&limit=1&appid=$_APIKey';

  static String fiveDaysWeatherForecastPath(
          {required String latitude, required String longitude}) =>
      'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$_APIKey';
}
