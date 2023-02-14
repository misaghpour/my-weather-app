import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';

import '../home/components/pollution_detail_widget.dart';

class AirQualityScrren extends StatelessWidget {
  AirQualityScrren({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Quality'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        child: controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.errorMsg.value.isNotEmpty
                ? Container(
                    child: Text(controller.errorMsg.value),
                  )
                : Column(
                    children: [
                      PollutionDetailWidget(),
                    ],
                  ),
      )),
    );
  }
}
