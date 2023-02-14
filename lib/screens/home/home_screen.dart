import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';
import 'package:my_weather_app/routes/app_pages.dart';
import 'package:my_weather_app/screens/home/components/current_weather_detail.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16.0),
          child: controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : controller.errorMsg.value.isNotEmpty
                  ? Container(
                      child: Text(controller.errorMsg.value),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.MY_LOCATIONS);
                                },
                                child: Icon(
                                  Icons.add,
                                  size: Get.width / 13,
                                ),
                              ),
                              Spacer(),
                              Text(
                                controller.textController.text,
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              SizedBox(
                                width: Get.width / 13,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Last Updated Time: " +
                                  controller.timeOfDayStr.value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          CurrentWeatherDetail(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.goToMoreInfoScreen();
                                },
                                child: Container(
                                  width: Get.width / 3,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Center(
                                      child: Text(
                                    'More',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 13,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToAirQualityScreen();
                                },
                                child: Container(
                                  width: Get.width / 3,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Center(
                                      child: Text(
                                    'Air Quality',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              controller.goToForecastScreen();
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
                              child: Center(
                                  child: Text(
                                '5-Day Forecast',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
        ),
      )),
    );
  }
}
