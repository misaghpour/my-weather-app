class WeatherModel {
  final temp;
  final temp_max;
  final temp_min;
  final pressure;
  final humidity;
  final bool isValid;

  WeatherModel(
      {required this.isValid,
      required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.pressure,
      required this.humidity});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final mainJson = json['main'];
    if (json['main'] == null) {
      return WeatherModel(
          isValid: false,
          temp: -1,
          temp_max: -1,
          temp_min: -1,
          pressure: -1,
          humidity: -1);
    } else {
      return WeatherModel(
          isValid: true,
          temp: mainJson['temp'] as double,
          temp_max: mainJson['temp_max'] as double,
          temp_min: mainJson['temp_min'] as double,
          pressure: mainJson['pressure'] as int,
          humidity: mainJson['humidity'] as int);
    }
  }

  factory WeatherModel.init() {
    return WeatherModel(
        isValid: false,
        temp: 0,
        temp_max: 0,
        temp_min: 0,
        pressure: 0,
        humidity: 0);
  }
}
