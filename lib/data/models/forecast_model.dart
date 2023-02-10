import 'package:my_weather_app/data/models/weather_mode.dart';

class ForecastModel {
  List<WeatherModel> list = [];
  final bool isValid;

  ForecastModel({required this.list, required this.isValid});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final listJson = json['list'];
    if (listJson == null) {
      return ForecastModel(list: [], isValid: false);
    } else {
      final List<WeatherModel> list = List<WeatherModel>.from(
          listJson.map((data) => WeatherModel.fromJson(data)).toList());
      return ForecastModel(list: list, isValid: true);
    }
  }

  factory ForecastModel.init() {
    return ForecastModel(list: [], isValid: false);
  }
}
