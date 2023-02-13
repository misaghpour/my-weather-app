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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.grey.withOpacity(0.25)),
      child: Column(
        children: [
          Text(
            controller.currentWeatherModel.value.description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            controller.currentWeatherModel.value.temp.toString() + ' °C',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  ),
                  Text(
                    controller.currentWeatherModel.value.temp_min.toString() +
                        ' °C',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  ),
                  Text(
                    controller.currentWeatherModel.value.temp_max.toString() +
                        ' °C',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Pres.'),
                  Text(
                    controller.currentWeatherModel.value.pressure.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text('Hum.'),
                  Text(
                    controller.currentWeatherModel.value.humidity.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
