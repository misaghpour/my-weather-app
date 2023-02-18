import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/controllers/api_controller.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/geo_model.dart';
import 'package:my_weather_app/data/models/pollution_model.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/routes/app_pages.dart';

class AppController extends GetxController {
  RxString city = "Kashan".obs;
  Rx<WeatherModel> currentWeatherModel = WeatherModel.init().obs;
  Rx<ForecastModel> forecastWeatherModel = ForecastModel.init().obs;
  Rx<PollutionModel> pollutionModel = PollutionModel.init().obs;
  List<GeoModel> cities = <GeoModel>[];

  RxString get timeOfDayStr {
    var dt = DateTime.fromMillisecondsSinceEpoch(
        this.currentWeatherModel.value.dateTimeLong * 1000);
    var dtFormat = DateFormat("HH:mm").format(dt);
    return dtFormat.obs;
  }

  RxBool get isLoading => apiController.isLoading;
  RxString get errorMsg => apiController.errorMsg;

  final APIController apiController = Get.find();
  final textController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    textController.text = city.value;

    await _fetchCurrentWeather();
    await _fetchForecastData();
    await _fetchPollutionData();
  }

  _fetchCurrentWeather() async {
    currentWeatherModel.value =
        await apiController.fetchCurrentCity(city: city.value);
  }

  goToMoreInfoScreen() {
    // todo:
  }

  goToAirQualityScreen() {
    Get.toNamed(Routes.AIR_QUALITY);
  }

  goToForecastScreen() {
    Get.toNamed(Routes.FORECAST);
  }

  _fetchForecastData() async {
    forecastWeatherModel.value =
        await apiController.fetchForecast(city: city.value);
  }

  _fetchPollutionData() async {
    pollutionModel.value = await apiController.fetchPollution(city: city.value);
  }

  reload() async {
    this.city.value = textController.text;
    await _fetchCurrentWeather();
    await _fetchForecastData();
    await _fetchPollutionData();
  }

  setAsDefaultCity({required String city}) {
    textController.text = city;
    reload();
  }

  searchCity() async {
    this.city.value = textController.text;
    cities = await apiController.searchCities(city: city.value);
  }
}
