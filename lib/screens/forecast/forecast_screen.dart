import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';

import '../../data/models/weather_model.dart';
import '../../widgets/forecast_item_widget.dart';

class ForecastScreen extends StatelessWidget {
  ForecastScreen({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5-Day Forecast'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16),
          child: controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : controller.errorMsg.value.isNotEmpty
                  ? Container(
                      child: Text(controller.errorMsg.value),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (WeatherModel model
                              in controller.forecastWeatherModel.value.list)
                            ForecastItemWidget(model: model)
                        ],
                      ),
                    ),
        ),
      )),
    );
  }
}
