import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/api_controller.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class AppController extends GetxController {
  RxString city = "Kashan".obs;
  Rx<WeatherModel> model = WeatherModel.init().obs;
  RxBool isLoading = true.obs;
  RxString errorMsg = "".obs;

  final APIController apiController = Get.find();
  final textController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    textController.text = city.value;

    await _fetchData();
  }

  _fetchData() async {
    errorMsg.value = "";
    isLoading.value = true;
    model.value = await apiController.fetchCurrentCity(city: city.value);
    if (!model.value.isValid) errorMsg.value = "Your city name is Not valid :(";
    isLoading.value = false;
  }

  reload() {
    _fetchData();
  }

  changeCity() {
    this.city.value = textController.text;
    _fetchData();
  }
}
