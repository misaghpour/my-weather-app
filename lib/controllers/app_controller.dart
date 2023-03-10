import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/controllers/api_controller.dart';
import 'package:my_weather_app/data/models/forecast_model.dart';
import 'package:my_weather_app/data/models/geo_model.dart';
import 'package:my_weather_app/data/models/pollution_model.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/routes/app_pages.dart';
import 'package:my_weather_app/utils/debouncer.dart';

class AppController extends GetxController {
  RxString city = "Kashan".obs;
  Rx<WeatherModel> currentWeatherModel = WeatherModel.init().obs;
  Rx<ForecastModel> forecastWeatherModel = ForecastModel.init().obs;
  Rx<PollutionModel> pollutionModel = PollutionModel.init().obs;
  RxList<GeoModel> cities = <GeoModel>[].obs;
  RxList<GeoModel> savedCities = <GeoModel>[].obs;
  Rx<GeoModel> currentCity = GeoModel.init().obs;

  RxBool isSaved(GeoModel model) {
    var result = false;
    for (int i = 0; i < savedCities.length; i++) {
      if (model.lat == savedCities[i].lat && model.lon == savedCities[i].lon)
        result = true;
    }
    return result.obs;
  }

  RxBool isCurrentCity(GeoModel model) {
    var result = false;
    if (model.lat == currentCity.value.lat &&
        model.lon == currentCity.value.lon) result = true;
    return result.obs;
  }

  final _debouncer = Debouncer(milliseconds: 500);

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

  RxString searchText = "".obs;

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

  setAsDefaultCity({required GeoModel city}) {
    // textController.text = city.name;
    currentCity.value = city;
    reload();
  }

  searchCity() async {
    searchText.value = textController.text;
    _debouncer.run(() async {
      if (textController.text.isNotEmpty) {
        cities.value =
            await apiController.searchCities(city: textController.text);
      }
    });
  }

  saveCity(GeoModel model) {
    if (isSaved(model).value) {
      savedCities.remove(model);
    } else {
      savedCities.add(model);
    }
    savedCities.refresh();
    cities.refresh();
  }
}
