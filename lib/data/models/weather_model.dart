import 'package:intl/intl.dart';
import 'package:my_weather_app/data/constants.dart';

class WeatherModel {
  final temp;
  final temp_max;
  final temp_min;
  final pressure;
  final humidity;
  final bool isValid;
  final dateTimeLong;
  final String description;
  final String icon;

  String get dateTimeStr {
    var dt = DateTime.fromMillisecondsSinceEpoch(this.dateTimeLong * 1000);
    var dtFormat = DateFormat("yyyy-MM-dd HH:mm").format(dt);
    return dtFormat;
  }

  String get iconPath {
    var path = '';
    switch (this.icon) {
      case "01d": // clear
        path = WeatherIcons.SUN;
        break;
      case "01n":
        path = WeatherIcons.MOON;
        break;
      case "02d": // cloud
        path = WeatherIcons.CLOUD;
        break;
      case "02n":
        path = WeatherIcons.CLOUD;
        break;
      case "03d": // cloud
        path = WeatherIcons.CLOUD;
        break;
      case "03n":
        path = WeatherIcons.CLOUD;
        break;
      case "04d": // cloud
        path = WeatherIcons.CLOUD;
        break;
      case "04n":
        path = WeatherIcons.CLOUD;
        break;
      case "09d": // rain
        path = WeatherIcons.RAIN;
        break;
      case "09n":
        path = WeatherIcons.RAIN;
        break;
      case "10d": // rain
        path = WeatherIcons.RAIN;
        break;
      case "10n":
        path = WeatherIcons.RAIN;
        break;
      case "11d": // thunderstorm
        path = WeatherIcons.THUNDERSTORM;
        break;
      case "11n":
        path = WeatherIcons.THUNDERSTORM;
        break;
      case "13d": // snow
        path = WeatherIcons.SNOW;
        break;
      case "13n":
        path = WeatherIcons.SNOW;
        break;
      case "50d": // mist
        path = WeatherIcons.MIST;
        break;
      case "50n":
        path = WeatherIcons.MIST;
        break;

      default:
    }
    return path;
  }

  WeatherModel(
      {required this.isValid,
      required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.pressure,
      required this.humidity,
      required this.dateTimeLong,
      required this.description,
      required this.icon});

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
          icon: "",
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
          icon: weatherJson["icon"],
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
        icon: "",
        description: "");
  }
}
