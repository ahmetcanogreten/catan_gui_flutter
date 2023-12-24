import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final Color color;
  final double size;
  const CityWidget({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.apartment_rounded,
      color: color,
      size: size,
    );
  }
}
