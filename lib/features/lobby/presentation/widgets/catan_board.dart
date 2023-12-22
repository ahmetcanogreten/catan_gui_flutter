import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SettlementWidget extends StatelessWidget {
  final Color color;
  const SettlementWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.apartment_rounded,
      color: color,
      size: 50,
    );
  }
}

class CatanBoard extends StatelessWidget {
  final List<ResourceType> resources;
  final List<int> numbers;
  final List<BuildingWithColor> settlements;

  const CatanBoard({
    super.key,
    required this.resources,
    required this.numbers,
    this.settlements = const [],
  });

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
        height: hexagonHeight * 4,
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

              // Settlement
              // 0-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: -1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 0)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 0)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 1-th index
              Positioned(
                left: 0,
                top: -2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 1)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 1)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 2-th index
              Positioned(
                left: hexagonWidth / 2,
                top: -1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 2)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 2)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              //3-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: -2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 3)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 3)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              //4-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: -1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 4)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 4)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 5-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: -2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 5)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 5)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 6-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: -1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 6)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 6)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 7-th index
              Positioned(
                left: -2 * hexagonWidth / 2,
                top: 2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 7)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 7)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 8-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: 1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 8)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 8)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 9-th index
              Positioned(
                left: 0 * hexagonWidth / 2,
                top: 2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 9)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere((element) => element.index == 9)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 10-th index
              Positioned(
                left: 1 * hexagonWidth / 2,
                top: 1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 10)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 10)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 11-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: 2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 11)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 11)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 12-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: 1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 12)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 12)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 13-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: 2 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 13)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 13)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 14-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: 1 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 14)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 14)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 15-th index
              Positioned(
                left: -3 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 15)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 15)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 16-th index
              Positioned(
                left: -2 * hexagonWidth / 2,
                top: 4 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 16)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 16)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 17-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 17)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 17)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 18-th index
              Positioned(
                left: 0 * hexagonWidth / 2,
                top: 4 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 18)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 18)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 19-th index
              Positioned(
                left: 1 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 19)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 19)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 20-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: 4 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 20)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 20)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 21-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 21)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 21)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 22-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: 4 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 22)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 22)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 23-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 23)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 23)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 24-th index
              Positioned(
                left: 6 * hexagonWidth / 2,
                top: 4 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 24)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 24)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 25-th index
              Positioned(
                left: 7 * hexagonWidth / 2,
                top: 5 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 25)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 25)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 26-th index
              Positioned(
                left: -3 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 26)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 26)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 27-th index
              Positioned(
                left: -2 * hexagonWidth / 2,
                top: 8 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 27)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 27)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 28-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 28)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 28)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 29-th index
              Positioned(
                left: 0 * hexagonWidth / 2,
                top: 8 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 29)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 29)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 30-th index
              Positioned(
                left: 1 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 30)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 30)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 31-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: 8 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 31)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 31)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 32-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 32)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 32)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 33-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: 8 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 33)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 33)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 34-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 34)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 34)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 35-th index
              Positioned(
                left: 6 * hexagonWidth / 2,
                top: 8 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 35)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 35)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 36-th index
              Positioned(
                left: 7 * hexagonWidth / 2,
                top: 7 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 36)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 36)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 37-th index
              Positioned(
                left: -2 * hexagonWidth / 2,
                top: 10 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 37)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 37)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 38-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: 11 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 38)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 38)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 39-th index
              Positioned(
                left: 0 * hexagonWidth / 2,
                top: 10 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 39)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 39)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 40-th index
              Positioned(
                left: 1 * hexagonWidth / 2,
                top: 11 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 40)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 40)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 41-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: 10 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 41)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 41)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 42-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: 11 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 42)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 42)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 43-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: 10 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 43)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 43)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 44-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: 11 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 44)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 44)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 45-th index
              Positioned(
                left: 6 * hexagonWidth / 2,
                top: 10 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 45)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 45)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 46-th index
              Positioned(
                left: -1 * hexagonWidth / 2,
                top: 13 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 46)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 46)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 47-th index
              Positioned(
                left: 0 * hexagonWidth / 2,
                top: 14 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 47)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 47)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 48-th index
              Positioned(
                left: 1 * hexagonWidth / 2,
                top: 13 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 48)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 48)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 49-th index
              Positioned(
                left: 2 * hexagonWidth / 2,
                top: 14 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 49)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 49)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 50-th index
              Positioned(
                left: 3 * hexagonWidth / 2,
                top: 13 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 50)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 50)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 51-th index
              Positioned(
                left: 4 * hexagonWidth / 2,
                top: 14 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 51)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 51)
                                    .color)
                            : const SizedBox.shrink())),
              ),
              // 52-th index
              Positioned(
                left: 5 * hexagonWidth / 2,
                top: 13 * hexagonHeight / 4,
                child: SizedBox(
                    width: hexagonWidth,
                    height: hexagonHeight,
                    child: Center(
                        child: settlements.any((element) => element.index == 52)
                            ? SettlementWidget(
                                color: settlements
                                    .firstWhere(
                                        (element) => element.index == 52)
                                    .color)
                            : const SizedBox.shrink())),
              ),
            ],
          ),
        ),
      );
    });
  }
}
