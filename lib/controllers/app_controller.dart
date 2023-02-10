import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/api_controller.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class AppController extends GetxController {
  RxString city = "Kashan".obs;
  Rx<WeatherModel> currentWeatherModel = WeatherModel.init().obs;
  Rx<ForecastModel> forecastWeatherModel = ForecastModel.init().obs;

  RxBool isLoading = true.obs;
  RxString errorMsg = "".obs;

  final APIController apiController = Get.find();
  final textController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    textController.text = city.value;

    await _fetchCurrentData();
    await _fetchForecastData();
  }

  _fetchCurrentData() async {
    errorMsg.value = "";
    isLoading.value = true;
    currentWeatherModel.value =
        await apiController.fetchCurrentCity(city: city.value);
    if (!currentWeatherModel.value.isValid)
      errorMsg.value = "Your city name is Not valid :(";
    isLoading.value = false;
  }

  _fetchForecastData() async {
    errorMsg.value = "";
    isLoading.value = true;
    forecastWeatherModel.value =
        await apiController.fetchForecast(city: city.value);
    if (!forecastWeatherModel.value.isValid)
      errorMsg.value = "Your city number is Not valid";
    isLoading.value = false;
  }

  reload() {
    _fetchCurrentData();
    _fetchForecastData();
  }

  changeCity() {
    this.city.value = textController.text;
    _fetchCurrentData();
    _fetchForecastData();
  }
}
