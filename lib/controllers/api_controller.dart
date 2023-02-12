import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/geo_model.dart';
import 'package:my_weather_app/data/models/pollution_model.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class APIController extends GetxController {
  final _connect = GetConnect();

  Future<WeatherModel> fetchCurrentCity({required String city}) async {
    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric';
    final response = await _connect.get(url);

    final weatherModel = WeatherModel.fromJson(response.body);
    return weatherModel;
  }

  Future<ForecastModel> fetchForecast({required String city}) async {
    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$api_key&units=metric';
    final response = await _connect.get(url);

    final forecastModel = ForecastModel.fromJson(response.body);
    return forecastModel;
  }

  Future<GeoModel> fetchGeo({required String city}) async {
    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$api_key';
    final response = await _connect.get(url);

    final geoModel = GeoModel.fromJson(response.body[0]);
    return geoModel;
  }

  Future<PollutionModel> fetchPollution({required String city}) async {
    final geoModel = await fetchGeo(city: city);
    final lat = geoModel.lat;
    final lon = geoModel.lon;

    await dotenv.load();
    final api_key = dotenv.env['API_KEY'];
    final url =
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$api_key';
    final response = await _connect.get(url);

    final pollutionModel = PollutionModel.fromJson(response.body);
    return pollutionModel;
  }
}
