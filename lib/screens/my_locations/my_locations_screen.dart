import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controllers/app_controller.dart';
import 'package:my_weather_app/data/models/geo_model.dart';

class MyLocationsScreen extends StatelessWidget {
  MyLocationsScreen({super.key});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Locations'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
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
                        controller.searchCity();
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
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              for (GeoModel city in controller.cities)
                                InkWell(
                                  onTap: () {
                                    // todo:
                                    controller.setAsDefaultCity(
                                        city: city.name);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          city.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          city.country,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Divider()
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )
            ],
          ),
        ),
      )),
    );
  }
}
