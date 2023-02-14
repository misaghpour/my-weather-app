import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/pollution_item_widget.dart';

class PollutionDetailWidget extends StatelessWidget {
  PollutionDetailWidget({
    super.key,
  });

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.grey.withOpacity(0.25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Air Quality',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PollutionItemWidget(
                label: "CO",
                value: controller.pollutionModel.value.co,
                unit: "ml/G",
              ),
              PollutionItemWidget(
                label: "No",
                value: controller.pollutionModel.value.no,
                unit: "ml/G",
              ),
              PollutionItemWidget(
                label: "NO2",
                value: controller.pollutionModel.value.no2,
                unit: "ml/G",
              ),
              
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PollutionItemWidget(
                label: "O3",
                value: controller.pollutionModel.value.o3,
                unit: "ml/G",
              ),
              PollutionItemWidget(
                label: "SO2",
                value: controller.pollutionModel.value.so2,
                unit: "ml/G",
              ),
              PollutionItemWidget(
                label: "NH3",
                value: controller.pollutionModel.value.nh3,
                unit: "ml/G",
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PollutionItemWidget(
                label: "PM2_5",
                value: controller.pollutionModel.value.pm2_5,
                unit: "ml/G",
              ),
              PollutionItemWidget(
                label: "PM10",
                value: controller.pollutionModel.value.pm10,
                unit: "ml/G",
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
