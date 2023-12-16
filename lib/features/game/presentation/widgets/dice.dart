import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;
  const Dice({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Container(
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: maxSize * 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
