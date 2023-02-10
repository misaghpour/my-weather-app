import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class APIController extends GetxController {
  final _connect = GetConnect();

  Future<WeatherModel> fetchCurrentCity({required String city}) async {
    // final api_key = '52a28657ca36b07c3a80b5f8901981ff';
    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric';
    final response = await _connect.get(url);

    final weatherModel = WeatherModel.fromJson(response.body);
    return weatherModel;
  }

  Future<ForecastModel> fetchForecast({required String city}) async {
    // final api_key = '52a28657ca36b07c3a80b5f8901981ff';
    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$api_key&units=metric';
    final response = await _connect.get(url);

    final forecastModel = ForecastModel.fromJson(response.body);
    return forecastModel;
  }
}
