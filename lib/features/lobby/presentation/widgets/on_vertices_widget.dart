import 'package:flutter/material.dart';

class OnVerticesWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final List<Widget> children;

  const OnVerticesWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    assert(children.length == 54);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Settlement
        // 0-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[0]),
        ),
        // 1-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0,
          top: hexagonHeight * 0.5 + -2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[1]),
        ),
        // 2-th index
        Positioned(
          left: hexagonWidth * 1.5 + hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[2]),
        ),
        //3-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[3]),
        ),
        //4-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[4]),
        ),
        // 5-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[5]),
        ),
        // 6-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + -1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[6]),
        ),
        // 7-th index
        Positioned(
          left: hexagonWidth * 1.5 + -2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[7]),
        ),
        // 8-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[8]),
        ),
        // 9-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[9]),
        ),
        // 10-th index
        Positioned(
          left: hexagonWidth * 1.5 + 1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[10]),
        ),
        // 11-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[11]),
        ),
        // 12-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[12]),
        ),
        // 13-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[13]),
        ),
        // 14-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 1 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[14]),
        ),
        // 15-th index
        Positioned(
          left: hexagonWidth * 1.5 + 6 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[15]),
        ),
        // 16-th index
        Positioned(
          left: hexagonWidth * 1.5 + -3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[16]),
        ),
        // 17-th index
        Positioned(
          left: hexagonWidth * 1.5 + -2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 4 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[17]),
        ),
        // 18-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[18]),
        ),
        // 19-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 4 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[19]),
        ),
        // 20-th index
        Positioned(
          left: hexagonWidth * 1.5 + 1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[20]),
        ),
        // 21-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 4 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[21]),
        ),
        // 22-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[22]),
        ),
        // 23-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 4 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[23]),
        ),
        // 24-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[24]),
        ),
        // 25-th index
        Positioned(
          left: hexagonWidth * 1.5 + 6 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 4 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[25]),
        ),
        // 26-th index
        Positioned(
          left: hexagonWidth * 1.5 + 7 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 5 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[26]),
        ),
        // 27-th index
        Positioned(
          left: hexagonWidth * 1.5 + -3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[27]),
        ),
        // 28-th index
        Positioned(
          left: hexagonWidth * 1.5 + -2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 8 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[28]),
        ),
        // 29-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[29]),
        ),
        // 30-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 8 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[30]),
        ),
        // 31-th index
        Positioned(
          left: hexagonWidth * 1.5 + 1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[31]),
        ),
        // 32-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 8 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[32]),
        ),
        // 33-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[33]),
        ),
        // 34-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 8 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[34]),
        ),
        // 35-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[35]),
        ),
        // 36-th index
        Positioned(
          left: hexagonWidth * 1.5 + 6 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 8 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[36]),
        ),
        // 37-th index
        Positioned(
          left: hexagonWidth * 1.5 + 7 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 7 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[37]),
        ),
        // 38-th index
        Positioned(
          left: hexagonWidth * 1.5 + -2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 10 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[38]),
        ),
        // 39-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 11 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[39]),
        ),
        // 40-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 10 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[40]),
        ),
        // 41-th index
        Positioned(
          left: hexagonWidth * 1.5 + 1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 11 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[41]),
        ),
        // 42-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 10 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[42]),
        ),
        // 43-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 11 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[43]),
        ),
        // 44-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 10 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[44]),
        ),
        // 45-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 11 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[45]),
        ),
        // 46-th index
        Positioned(
          left: hexagonWidth * 1.5 + 6 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 10 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[46]),
        ),
        // 47-th index
        Positioned(
          left: hexagonWidth * 1.5 + -1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 13 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[47]),
        ),
        // 48-th index
        Positioned(
          left: hexagonWidth * 1.5 + 0 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 14 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[48]),
        ),
        // 49-th index
        Positioned(
          left: hexagonWidth * 1.5 + 1 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 13 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[49]),
        ),
        // 50-th index
        Positioned(
          left: hexagonWidth * 1.5 + 2 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 14 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[50]),
        ),
        // 51-th index
        Positioned(
          left: hexagonWidth * 1.5 + 3 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 13 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[51]),
        ),
        // 52-th index
        Positioned(
          left: hexagonWidth * 1.5 + 4 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 14 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[52]),
        ),
        // 53-th index
        Positioned(
          left: hexagonWidth * 1.5 + 5 * hexagonWidth / 2,
          top: hexagonHeight * 0.5 + 13 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth, height: hexagonHeight, child: children[53]),
        ),
      ],
    );
  }
}
