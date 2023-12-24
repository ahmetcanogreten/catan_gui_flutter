import 'package:flutter/material.dart';

Color getUserColor(int index) {
  switch (index) {
    case 0:
      return Colors.red.shade900;
    case 1:
      return Colors.blue.shade900;
    case 2:
      return Colors.green.shade900;
    case 3:
      return Colors.yellow.shade900;
    default:
      return Colors.white;
  }
}
