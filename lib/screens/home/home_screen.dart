import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Weather'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controller.textController,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.changeCity();
                    },
                    child: Text('Get')),
                controller.isLoading.value
                    ? CircularProgressIndicator()
                    : controller.errorMsg.value.isNotEmpty
                        ? Container(
                            child: Text(controller.errorMsg.value),
                          )
                        : Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    controller.textController.text,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Divider(),
                                  Text('Date Time:'),
                                  Text(controller
                                      .currentWeatherModel.value.dateTimeStr),
                                  Text(
                                    'Current Status',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Divider(),
                                  Text('Temprature: '),
                                  Text(
                                    controller.currentWeatherModel.value.temp
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Min Temprature: '),
                                          Text(
                                            controller.currentWeatherModel.value
                                                .temp_min
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        children: [
                                          Text('Max Temprature: '),
                                          Text(
                                            controller.currentWeatherModel.value
                                                .temp_max
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text('Pressure: '),
                                  Text(
                                    controller
                                        .currentWeatherModel.value.pressure
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text('Humidity: '),
                                  Text(
                                    controller
                                        .currentWeatherModel.value.humidity
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(),
                                  Text(
                                    'Forecast 5 Days',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Divider(),
                                  for (WeatherModel model in controller
                                      .forecastWeatherModel.value.list)
                                    Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  model.temp.toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Min: '),
                                                        Text(model.temp_min.toString())
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Max: '),
                                                        Text(model.temp_max.toString())
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(model.dateTimeStr)
                                            ],
                                          ),
                                        ),
                                        Divider()
                                      ],
                                    )
                                ],
                              ),
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
