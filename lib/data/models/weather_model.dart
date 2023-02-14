import 'package:intl/intl.dart';

class WeatherModel {
  final temp;
  final temp_max;
  final temp_min;
  final pressure;
  final humidity;
  final bool isValid;
  final dateTimeLong;
  final String description;

  String get dateTimeStr {
    var dt = DateTime.fromMillisecondsSinceEpoch(this.dateTimeLong * 1000);
    var dtFormat = DateFormat("yyyy-MM-dd HH:mm").format(dt);
    return dtFormat;
  }

  WeatherModel(
      {required this.isValid,
      required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.pressure,
      required this.humidity,
      required this.dateTimeLong,
      required this.description});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final mainJson = json['main'];
    if (json['main'] == null) {
      return WeatherModel(
          isValid: false,
          temp: -1,
          temp_max: -1,
          temp_min: -1,
          pressure: -1,
          humidity: -1,
          dateTimeLong: -1,
          description: "");
    } else {
      final weatherJson = json['weather'][0];

      return WeatherModel(
          isValid: true,
          temp: double.parse(mainJson['temp'].toString()),
          temp_max: double.parse(mainJson['temp_max'].toString()),
          temp_min: double.parse(mainJson['temp_min'].toString()),
          pressure: mainJson['pressure'],
          humidity: mainJson['humidity'],
          dateTimeLong: json['dt'] as int,
          description: weatherJson['main']);
    }
  }

  factory WeatherModel.init() {
    return WeatherModel(
        isValid: false,
        temp: 0,
        temp_max: 0,
        temp_min: 0,
        pressure: 0,
        humidity: 0,
        dateTimeLong: 0,
        description: "");
  }
}
