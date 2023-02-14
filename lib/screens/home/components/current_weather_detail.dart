import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';

class CurrentWeatherDetail extends StatelessWidget {
  CurrentWeatherDetail({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            controller.currentWeatherModel.value.description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('  ', style: TextStyle(fontSize: 20),),
              Text(
                controller.currentWeatherModel.value.temp.toString(),
                style: TextStyle(fontSize: Get.size.width /7, fontWeight: FontWeight.bold),
              ),
              Text('°C', style: TextStyle(fontSize: 20),),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: Get.width / 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.currentWeatherModel.value.temp_min.toString(),
                        style: TextStyle(fontSize: Get.width / 13, fontWeight: FontWeight.bold),
                      ),
                      Text('°C')
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: Get.width / 9,
              ),
              Column(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                    size: Get.size.width / 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.currentWeatherModel.value.temp_max.toString(),
                        style: TextStyle(fontSize: Get.width / 13, fontWeight: FontWeight.bold),
                      ),
                      Text('°C')
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Get.size.width / 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Pressure'),
                  Text(
                    controller.currentWeatherModel.value.pressure.toString(),
                    style: TextStyle(fontSize: Get.size.width / 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: Get.size.width / 9,
              ),
              Column(
                children: [
                  Text('Humidity'),
                  Text(
                    controller.currentWeatherModel.value.humidity.toString(),
                    style: TextStyle(fontSize: Get.size.width / 12, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
