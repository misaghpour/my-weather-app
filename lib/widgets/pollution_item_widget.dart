import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PollutionItemWidget extends StatelessWidget {
  const PollutionItemWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.unit});

  final value;
  final String label;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      width: Get.size.width / 6,
      height: Get.size.width / 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11),
          ),
          // Spacer(),
          Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Spacer(),
          Text(unit)
        ],
      ),
    );
  }
}
