import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatanBoard extends StatelessWidget {
  final List<ResourceType> resources;
  final List<int> numbers;
  const CatanBoard({super.key, required this.resources, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      maxSize = maxSize * 1.25;

      final hexagonHeight = maxSize * 0.2;
      final hexagonWidth = hexagonHeight / 2 * 1.732050808;

      final verticalShift = hexagonHeight * 0.75;
      final horizontalShift = hexagonWidth;

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

      Widget getResourceImage(ResourceType resource) {
        switch (resource) {
          case ResourceType.fields:
            return Assets.images.fields.image(fit: BoxFit.fill);
          case ResourceType.forest:
            return Assets.images.forest.image(fit: BoxFit.fill);
          case ResourceType.hills:
            return Assets.images.hills.image(fit: BoxFit.fill);
          case ResourceType.mountains:
            return Assets.images.mountains.image(fit: BoxFit.fill);
          case ResourceType.pasture:
            return Assets.images.pasture.image(fit: BoxFit.fill);
          case ResourceType.desert:
            return Assets.images.desert.image(fit: BoxFit.fill);
        }
      }

      return SizedBox(
        width: hexagonWidth * 5,
        height: hexagonHeight * 5,
        child: Transform.translate(
          offset: Offset(hexagonWidth, 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // First row
              Positioned(
                left: 0,
                child: SizedBox(
                  width: hexagonWidth,
                  height: hexagonHeight,
                  child: getResourceImage(resources[0]),
                ),
              ),
              Positioned(
                left: 0,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[0].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[0]),
                          ),
                        ),
                      ),
                    )),
              ),

              Positioned(
                left: horizontalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[1])),
              ),
              Positioned(
                left: horizontalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[1].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[1]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: horizontalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[2])),
              ),
              Positioned(
                left: horizontalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[2].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[2]),
                          ),
                        ),
                      ),
                    )),
              ),
              // Second row
              Positioned(
                left: -1 * horizontalShift / 2,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[3])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[3].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[3]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[4])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[4].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[4]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[5])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[5].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[5]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[6])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[6].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[6]),
                          ),
                        ),
                      ),
                    )),
              ),
              // Third row
              Positioned(
                left: -2 * horizontalShift / 2,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[7])),
              ),
              Positioned(
                left: -2 * horizontalShift / 2,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[7].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[7]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[8])),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[8].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[8]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(ResourceType.desert)),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(7),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[9])),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[9].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[9]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 4,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[10])),
              ),
              Positioned(
                left: -2 * horizontalShift / 2 + horizontalShift * 4,
                top: verticalShift * 2,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[10].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[10]),
                          ),
                        ),
                      ),
                    )),
              ),
              // Fourth row
              Positioned(
                left: -1 * horizontalShift / 2,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[11])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[11].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[11]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[12])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[12].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[12]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[13])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[13].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[13]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[14])),
              ),
              Positioned(
                left: -1 * horizontalShift / 2 + horizontalShift * 3,
                top: verticalShift * 3,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[14].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[14]),
                          ),
                        ),
                      ),
                    )),
              ),
              // Fifth row
              Positioned(
                left: 0 * horizontalShift / 2,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[15])),
              ),
              Positioned(
                left: 0 * horizontalShift / 2,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[15].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[15]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[16])),
              ),
              Positioned(
                left: 0 * horizontalShift / 2 + horizontalShift,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[16].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[16]),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: getResourceImage(resources[17])),
              ),
              Positioned(
                left: 0 * horizontalShift / 2 + horizontalShift * 2,
                top: verticalShift * 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: hexagonWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Text(
                          numbers[17].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSizeForNumber(numbers[17]),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
