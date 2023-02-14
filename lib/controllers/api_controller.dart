import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/geo_model.dart';
import 'package:my_weather_app/data/models/pollution_model.dart';
import 'package:my_weather_app/data/models/weather_model.dart';

class APIController extends GetxController {
  final _connect = GetConnect();

  RxBool isLoading = false.obs;
  RxString errorMsg = "".obs;

  Future<WeatherModel> fetchCurrentCity({required String city}) async {
    try {
      errorMsg.value = "";
      isLoading.value = true;
      await dotenv.load();
      final api_key = dotenv.env['API_KEY'];
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api_key&units=metric';
      final response = await _connect.get(url);

      final weatherModel = WeatherModel.fromJson(response.body);
      if (!weatherModel.isValid)
        errorMsg.value = "Your city name is Not valid :(";
      return weatherModel;
    } catch (e) {
      errorMsg.value = "An Error has occurred.";
      return WeatherModel.init();
    } finally {
      isLoading.value = false;
    }
  }

  Future<ForecastModel> fetchForecast({required String city}) async {
    try {
      errorMsg.value = "";
      isLoading.value = true;
      await dotenv.load();
      final api_key = dotenv.env['API_KEY'];
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$api_key&units=metric';
      final response = await _connect.get(url);

      final forecastModel = ForecastModel.fromJson(response.body);
      if (!forecastModel.isValid)
        errorMsg.value = "Your city name is Not valid :(";
      return forecastModel;
    } catch (e) {
      errorMsg.value = "An Error has occured";
      errorMsg.value = "An Error has occured " + e.toString();
      return ForecastModel.init();
    } finally {
      isLoading.value = false;
    }
  }

  Future<GeoModel> fetchGeo({required String city}) async {
    try {
      isLoading.value = true;
      errorMsg.value = "";
      await dotenv.load();
      final api_key = dotenv.env['API_KEY'];
      final url =
          'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$api_key';
      final response = await _connect.get(url);

      final geoModel = GeoModel.fromJson(response.body[0]);
      if (!geoModel.isValid) errorMsg.value = "Your city name is Not valid :(";
      return geoModel;
    } catch (e) {
      errorMsg.value = "An Error has occured";
      errorMsg.value = "An Error has occured " + e.toString();
      return GeoModel.init();
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<GeoModel>> searchCities({required String city}) async {
    try {
      isLoading.value = true;
      errorMsg.value = "";
      await dotenv.load();
      final api_key = dotenv.env['API_KEY'];
      final url =
          'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=$api_key';
      final response = await _connect.get(url);

      // final geoModel = GeoModel.fromJson(response.body[0]);
      // if (!geoModel.isValid) errorMsg.value = "Your city name is Not valid :(";
      final List<GeoModel> list = List<GeoModel>.from(
          response.body.map((data) => GeoModel.fromJson(data)).toList());
          if(list.isEmpty) errorMsg.value = "Your city name is Not valid :(";
      return list;
    } catch (e) {
      errorMsg.value = "An Error has occured " + e.toString();

      final List<GeoModel> list = [];
      return list;
    } finally {
      isLoading.value = false;
    }
  }

  Future<PollutionModel> fetchPollution({required String city}) async {
    try {
      errorMsg.value = "";
      isLoading.value = true;

      final geoModel = await fetchGeo(city: city);
      final lat = geoModel.lat;
      final lon = geoModel.lon;

      await dotenv.load();
      final api_key = dotenv.env['API_KEY'];
      final url =
          'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$api_key';
      final response = await _connect.get(url);

      final pollutionModel = PollutionModel.fromJson(response.body);
      if (!pollutionModel.isValid)
        errorMsg.value = "Your city name is Not valid :(";
        
      return pollutionModel;
    } catch (e) {
      errorMsg.value = "An Error has occured";
      errorMsg.value = "An Error has occured " + e.toString();
      return PollutionModel.init();
    } finally {
      isLoading.value = false;
    }
  }
}
