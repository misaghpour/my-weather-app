import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                      onChanged: (value) {
                        controller.searchCity();
                      },
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Enter Your City',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'City',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              controller.isLoading.value
                  ? Expanded(
                      child: Center(
                          child: SpinKitDancingSquare(
                      color: Colors.blue,
                    )))
                  : controller.errorMsg.value.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            controller.errorMsg.value,
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              controller.searchText.value.isEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (GeoModel city
                                            in controller.savedCities)
                                          CityItemWidget(
                                              controller: controller,
                                              city: city),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        for (GeoModel city in controller.cities)
                                          CityItemWidget(
                                              controller: controller,
                                              city: city)
                                      ],
                                    ),
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

class CityItemWidget extends StatelessWidget {
  const CityItemWidget({
    super.key,
    required this.controller,
    required this.city,
  });

  final AppController controller;
  final GeoModel city;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.setAsDefaultCity(city: city);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: controller.isCurrentCity(city).value
                              ? Colors.blue
                              : Colors.black),
                    ),
                    Text(
                      city.country,
                      style: TextStyle(color: controller.isCurrentCity(city).value
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.grey),
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    controller.saveCity(city);
                  },
                  child: Icon(
                    controller.isSaved(city).value
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.red,
                  ))
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
