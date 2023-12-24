import 'package:flutter/material.dart';

class OnCentersWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final double horizontalShift;
  final double verticalShift;
  final List<Widget> children;

  const OnCentersWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.horizontalShift,
    required this.verticalShift,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    assert(children.length == 19);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // First row
        Positioned(
          left: hexagonWidth * 1.5 + 0,
          top: hexagonHeight * 0.5 + 0,
          child: SizedBox(
            width: hexagonWidth,
            height: hexagonHeight,
            child: children[0],
          ),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + horizontalShift,
          top: hexagonHeight * 0.5 + 0,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[1]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + horizontalShift * 2,
          top: hexagonHeight * 0.5 + 0,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[2]),
        ),
        // Second row
        Positioned(
          left: hexagonWidth * 1.5 + -1 * horizontalShift / 2,
          top: hexagonHeight * 0.5 + verticalShift,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[3]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + -1 * horizontalShift / 2 + horizontalShift,
          top: hexagonHeight * 0.5 + verticalShift,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[4]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -1 * horizontalShift / 2 +
              horizontalShift * 2,
          top: hexagonHeight * 0.5 + verticalShift,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[5]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -1 * horizontalShift / 2 +
              horizontalShift * 3,
          top: hexagonHeight * 0.5 + verticalShift,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[6]),
        ),
        // Third row
        Positioned(
          left: hexagonWidth * 1.5 + -2 * horizontalShift / 2,
          top: hexagonHeight * 0.5 + verticalShift * 2,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[7]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + -2 * horizontalShift / 2 + horizontalShift,
          top: hexagonHeight * 0.5 + verticalShift * 2,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[8]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -2 * horizontalShift / 2 +
              horizontalShift * 2,
          top: hexagonHeight * 0.5 + verticalShift * 2,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[9]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -2 * horizontalShift / 2 +
              horizontalShift * 3,
          top: hexagonHeight * 0.5 + verticalShift * 2,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[10]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -2 * horizontalShift / 2 +
              horizontalShift * 4,
          top: hexagonHeight * 0.5 + verticalShift * 2,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[11]),
        ),
        // Fourth row
        Positioned(
          left: hexagonWidth * 1.5 + -1 * horizontalShift / 2,
          top: hexagonHeight * 0.5 + verticalShift * 3,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[12]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + -1 * horizontalShift / 2 + horizontalShift,
          top: hexagonHeight * 0.5 + verticalShift * 3,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[13]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -1 * horizontalShift / 2 +
              horizontalShift * 2,
          top: hexagonHeight * 0.5 + verticalShift * 3,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[14]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              -1 * horizontalShift / 2 +
              horizontalShift * 3,
          top: hexagonHeight * 0.5 + verticalShift * 3,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[15]),
        ),
        // Fifth row
        Positioned(
          left: hexagonWidth * 1.5 + 0 * horizontalShift / 2,
          top: hexagonHeight * 0.5 + verticalShift * 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[16]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 + 0 * horizontalShift / 2 + horizontalShift,
          top: hexagonHeight * 0.5 + verticalShift * 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[17]),
        ),
        Positioned(
          left: hexagonWidth * 1.5 +
              0 * horizontalShift / 2 +
              horizontalShift * 2,
          top: hexagonHeight * 0.5 + verticalShift * 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[18]),
        ),
      ],
    );
  }
}
