import 'package:get/get.dart';
import 'package:my_weather_app/screens/home/home_screen.dart';
import 'package:my_weather_app/screens/welcome/welcome_screen.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.WELCOME, page: () => WelcomeScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen())
  ];
}
