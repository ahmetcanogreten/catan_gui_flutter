import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final Color color;
  const CityWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.apartment_rounded,
      color: color,
      size: 50,
    );
  }
}
