import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_weather_app/data/constants.dart';
import 'package:my_weather_app/data/models/weather_model.dart';

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
              SvgPicture.asset(
                model.iconPath,
                width: 32,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.temp.toString(),
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(' °C')
                      ],
                    ),
                    Text(model.description)
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          WeatherIcons.MIN_TEMP,
                          height: 24,
                        ),
                        Text(model.temp_min.toString() + ' °C')
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          WeatherIcons.MAX_TEMP,
                          height: 24,
                        ),
                        Text(model.temp_max.toString() + ' °C')
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(model.dateTimeDay, style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text(model.dateTimeHour, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
