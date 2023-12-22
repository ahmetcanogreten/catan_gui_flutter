import 'package:flutter/material.dart';

class RoadWidget extends StatelessWidget {
  final Color color;
  const RoadWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      width: 75, //hexagonWidth * 0.4,
      height: 10, //hexagonHeight * 0.05,
    );
  }
}
