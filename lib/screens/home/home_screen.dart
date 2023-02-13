import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/screens/home/components/current_weather_detail.dart';
import 'package:my_weather_app/widgets/forecast_item_widget.dart';

import 'components/pollution_detail_widget.dart';

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
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.textController,
                        decoration: InputDecoration(
                            hintText: 'Enter Your City',
                            border: OutlineInputBorder(),
                            labelText: 'City'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.reload();
                        },
                        child: Icon(
                          Icons.check,
                          size: 36,
                        )),
                  ],
                ),
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : controller.errorMsg.value.isNotEmpty
                        ? Container(
                            child: Text(controller.errorMsg.value),
                          )
                        : Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller.textController.text,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        controller.timeOfDayStr.value,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  CurrentWeatherDetail(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  PollutionDetailWidget(),
                                  SizedBox(height: 12,),
                                  Text(
                                    'Forecast 5 Days',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(),
                                  for (WeatherModel model in controller
                                      .forecastWeatherModel.value.list)
                                    ForecastItemWidget(model: model)
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
