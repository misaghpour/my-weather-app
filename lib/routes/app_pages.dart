import 'package:get/get.dart';
import 'package:my_weather_app/bindings/home_binding.dart';
import 'package:my_weather_app/screens/air_quality/air_quality_screen.dart';
import 'package:my_weather_app/screens/forecast/forecast_screen.dart';
import 'package:my_weather_app/screens/home/home_screen.dart';
import 'package:my_weather_app/screens/my_locations/my_locations_screen.dart';
import 'package:my_weather_app/screens/welcome/welcome_screen.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.WELCOME, page: () => WelcomeScreen()),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBindings()),
    GetPage(name: Routes.MY_LOCATIONS, page: () => MyLocationsScreen()),
    GetPage(name: Routes.FORECAST, page: () => ForecastScreen()),
    GetPage(name: Routes.AIR_QUALITY, page: () => AirQualityScrren())
  ];
}
