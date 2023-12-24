import 'package:flutter/material.dart';

class RoadWidget extends StatelessWidget {
  final Color color;
  final double length;
  final double width;
  const RoadWidget(
      {super.key,
      required this.color,
      required this.length,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      width: width,
      height: length,
    );
  }
}
