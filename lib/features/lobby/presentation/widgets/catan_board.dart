import 'package:catan_gui_flutter/features/lobby/models/resource.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatanBoard extends StatelessWidget {
  final List<Resource> resources;
  final List<int> number;
  const CatanBoard({super.key, required this.resources, required this.number});

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

      Widget getResourceImage(Resource resource) {
        switch (resource) {
          case Resource.fields:
            return Assets.images.fields.image(fit: BoxFit.fill);
          case Resource.forest:
            return Assets.images.forest.image(fit: BoxFit.fill);
          case Resource.hills:
            return Assets.images.hills.image(fit: BoxFit.fill);
          case Resource.mountains:
            return Assets.images.mountains.image(fit: BoxFit.fill);
          case Resource.pasture:
            return Assets.images.pasture.image(fit: BoxFit.fill);
          case Resource.desert:
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
              // Background
              Positioned(
                left: 0,
                child: SizedBox(
                  width: hexagonWidth,
                  height: hexagonHeight,
                  child: getResourceImage(resources[0]),
                ),
              ),
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
                          number[0].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[1].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
              // Positioned(
              //   left: horizontalShift * 2,
              //   child: SizedBox(
              //       width: hexagonWidth,
              //       height: hexagonHeight,
              //       child: Center(
              //         child: Container(
              //           alignment: Alignment.center,
              //           width: hexagonWidth * 0.4,
              //           decoration: BoxDecoration(
              //               color: Colors.orange.shade100,
              //               shape: BoxShape.circle,
              //               border: Border.all(color: Colors.black, width: 4)),
              //           child: Text(
              //             number[2].toString(),
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: hexagonHeight * 0.2,
              //             ),
              //           ),
              //         ),
              //       )),
              // ),
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
                          number[3].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[4].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[5].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[6].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[7].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[8].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                    child: getResourceImage(Resource.desert)),
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
                            fontSize: hexagonHeight * 0.2,
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
                          number[9].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[10].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[11].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[12].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[13].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[14].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[15].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[16].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
                          number[17].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: hexagonHeight * 0.2,
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
