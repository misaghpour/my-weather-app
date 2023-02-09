import 'package:get/get.dart';
import 'package:my_weather_app/controllers/api_controller.dart';
import 'package:my_weather_app/controllers/app_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => APIController());
    Get.lazyPut(() => AppController());
  }
}
