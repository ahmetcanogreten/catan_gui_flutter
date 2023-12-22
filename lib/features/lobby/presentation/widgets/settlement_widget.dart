import 'package:flutter/material.dart';

class SettlementWidget extends StatelessWidget {
  final Color color;
  const SettlementWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.home_rounded,
      color: color,
      size: 50,
    );
  }
}
