import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';

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
          child: Center(
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
                                Text('Temprature: '),
                                Text(
                                  controller.model.value.temp.toString(),
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
                                          controller.model.value.temp_min
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
                                          controller.model.value.temp_max
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
                                  controller.model.value.pressure.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text('Humidity: '),
                                Text(
                                  controller.model.value.humidity.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
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
