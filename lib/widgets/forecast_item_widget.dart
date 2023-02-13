import 'package:flutter/material.dart';
import 'package:my_weather_app/data/models/weather_mode.dart';

class ForecastItemWidget extends StatelessWidget {
  ForecastItemWidget({required this.model, super.key});

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.temp.toString() + ' °C',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.blue,
                        ),
                        Text(model.temp_min.toString() + ' °C')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        ),
                        Text(model.temp_max.toString() + ' °C')
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
    );
  }
}
