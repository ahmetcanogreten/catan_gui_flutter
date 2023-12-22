import 'package:flutter/material.dart';

class OnEdgesWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final List<Widget> children;

  const OnEdgesWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    assert(children.length == 72);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Road
        // 0-th index
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[0])),
        ),
        // 1-th index
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[1])),
        ),
        // 2-th index
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[2])),
        ),
        // 3-th index
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[3])),
        ),
        // 4-th index
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[4])),
        ),
        // 5-th index
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: -3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[5])),
        ),
        // 6-th index
        Positioned(
          left: -2 / 2 * hexagonWidth / 2,
          top: 0 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[6])),
        ),
        // 7-th index
        Positioned(
          left: 2 / 2 * hexagonWidth / 2,
          top: 0 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[7])),
        ),
        // 8-th index
        Positioned(
          left: 6 / 2 * hexagonWidth / 2,
          top: 0 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[8])),
        ),
        // 9-th index
        Positioned(
          left: 10 / 2 * hexagonWidth / 2,
          top: 0 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[9])),
        ),
        // 10-th index
        Positioned(
          left: -3 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[10])),
        ),
        // 11-th index
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[11])),
        ),
        // 12-th index
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[12])),
        ),
        // 13-th index
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[13])),
        ),
        // 14-th index
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[14])),
        ),
        // 15-th index
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[15])),
        ),
        // 16-th index
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[16])),
        ),
        // 17-th index
        Positioned(
          left: 11 / 2 * hexagonWidth / 2,
          top: 3 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[17])),
        ),
        // 18-th index
        Positioned(
          left: -4 / 2 * hexagonWidth / 2,
          top: 6 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[18])),
        ),
        // 19-th index
        Positioned(
          left: 0 / 2 * hexagonWidth / 2,
          top: 6 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[19])),
        ),
        // 20-th index
        Positioned(
          left: 4 / 2 * hexagonWidth / 2,
          top: 6 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[20])),
        ),
        // 21-th index
        Positioned(
          left: 8 / 2 * hexagonWidth / 2,
          top: 6 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[21])),
        ),
        // 22-th index
        Positioned(
          left: 12 / 2 * hexagonWidth / 2,
          top: 6 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[22])),
        ),
        // 23-th index
        Positioned(
          left: -5 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[23])),
        ),
        // 24-th index
        Positioned(
          left: -3 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[24])),
        ),
        // 25-th index
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[25])),
        ),
        // 26-th index
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[26])),
        ),
        // 27-th index
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[27])),
        ),
        // 28-th index
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[28])),
        ),
        // 29-th index
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[29])),
        ),
        // 30-th index
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[30])),
        ),
        // 31-th index
        Positioned(
          left: 11 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[31])),
        ),
        // 32-th index
        Positioned(
          left: 13 / 2 * hexagonWidth / 2,
          top: 9 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[32])),
        ),
        // 33-th index
        Positioned(
          left: -6 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[33])),
        ),
        // 34-th index
        Positioned(
          left: -2 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[34])),
        ),
        // 35-th index
        Positioned(
          left: 2 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[35])),
        ),
        // 36-th index
        Positioned(
          left: 6 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[36])),
        ),
        // 37-th index
        Positioned(
          left: 10 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[37])),
        ),
        // 38-th index
        Positioned(
          left: 14 / 2 * hexagonWidth / 2,
          top: 12 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[38])),
        ),
        // 39-th index
        Positioned(
          left: -5 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[39])),
        ),
        // 40-th index
        Positioned(
          left: -3 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[40])),
        ),
        // 41-th index
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[41])),
        ),
        // 42-th index
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[42])),
        ),
        // 43-th index
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[43])),
        ),
        // 44-th index
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[44])),
        ),
        // 45-th index
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[45])),
        ),
        // 46-th index
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[46])),
        ),
        // 47-th index
        Positioned(
          left: 11 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[47])),
        ),
        // 48-th index
        Positioned(
          left: 13 / 2 * hexagonWidth / 2,
          top: 15 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[48])),
        ),
        // 49-th index
        Positioned(
          left: -4 / 2 * hexagonWidth / 2,
          top: 18 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[49])),
        ),
        // 50-th index
        Positioned(
          left: 0 / 2 * hexagonWidth / 2,
          top: 18 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[50])),
        ),
        // 51-th index
        Positioned(
          left: 4 / 2 * hexagonWidth / 2,
          top: 18 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[51])),
        ),
        // 52-th index
        Positioned(
          left: 8 / 2 * hexagonWidth / 2,
          top: 18 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[52])),
        ),
        // 53-th index
        Positioned(
          left: 12 / 2 * hexagonWidth / 2,
          top: 18 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[53])),
        ),
        // 54-th index
        Positioned(
          left: -3 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[54])),
        ),
        // 55-th index
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[55])),
        ),
        // 56-th index
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[56])),
        ),
        // 57-th index
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[57])),
        ),
        // 58-th index
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[58])),
        ),
        // 59-th index
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[59])),
        ),
        // 60-th index
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[60])),
        ),
        // 61-th index
        Positioned(
          left: 11 / 2 * hexagonWidth / 2,
          top: 21 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[61])),
        ),
        // 62-th index
        Positioned(
          left: -2 / 2 * hexagonWidth / 2,
          top: 24 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[62])),
        ),
        // 63
        Positioned(
          left: 2 / 2 * hexagonWidth / 2,
          top: 24 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[63])),
        ),
        // 64
        Positioned(
          left: 6 / 2 * hexagonWidth / 2,
          top: 24 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[64])),
        ),
        // 65
        Positioned(
          left: 10 / 2 * hexagonWidth / 2,
          top: 24 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[65])),
        ),
        // 66
        Positioned(
          left: -1 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[66])),
        ),
        // 67
        Positioned(
          left: 1 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[67])),
        ),
        // 68
        Positioned(
          left: 3 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[68])),
        ),
        // 69
        Positioned(
          left: 5 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[69])),
        ),
        // 70
        Positioned(
          left: 7 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[70])),
        ),
        // 71
        Positioned(
          left: 9 / 2 * hexagonWidth / 2,
          top: 27 / 2 * hexagonHeight / 4,
          child: SizedBox(
              width: hexagonWidth,
              height: hexagonHeight,
              child: Center(child: children[71])),
        ),
      ],
    );
  }
}
