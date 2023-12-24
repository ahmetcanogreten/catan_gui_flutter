import 'package:flutter/material.dart';

class SettlementWidget extends StatelessWidget {
  final Color color;
  final double size;
  const SettlementWidget({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.home_rounded,
      color: color,
      size: size,
    );
  }
}
