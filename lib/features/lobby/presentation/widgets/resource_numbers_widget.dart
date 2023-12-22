import 'package:catan_gui_flutter/features/lobby/presentation/widgets/on_centers_widget.dart';
import 'package:flutter/material.dart';

class ResourceNumbersWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final double horizontalShift;
  final double verticalShift;
  final List<int> numbers;
  const ResourceNumbersWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.horizontalShift,
    required this.verticalShift,
    required this.numbers,
  });

  double getFontSizeForNumber(int number) {
    final fontSize = hexagonHeight * 0.2;
    switch (number) {
      case 2:
      case 12:
        return fontSize * 0.5;
      case 3:
      case 11:
        return fontSize * 0.6;
      case 4:
      case 10:
        return fontSize * 0.7;
      case 5:
      case 9:
        return fontSize * 0.8;
      case 6:
      case 8:
      case 7:
        return fontSize * 1;
      default:
        return fontSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnCentersWidget(
        hexagonWidth: hexagonWidth,
        hexagonHeight: hexagonHeight,
        horizontalShift: horizontalShift,
        verticalShift: verticalShift,
        children: numbers
            .map(
              (number) => Center(
                child: Container(
                  alignment: Alignment.center,
                  width: hexagonWidth * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 4)),
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getFontSizeForNumber(numbers[0]),
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
}
