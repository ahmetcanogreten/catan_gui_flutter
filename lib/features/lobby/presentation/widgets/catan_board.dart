import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/cities_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/resource_numbers_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/resources_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/roads_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/settlements_widget.dart';
import 'package:flutter/material.dart';

class CatanBoard extends StatelessWidget {
  final List<ResourceType> resources;
  final List<int> numbers;
  final List<BuildingWithColor> settlements;
  final List<BuildingWithColor> roads;
  final List<BuildingWithColor> cities;

  const CatanBoard({
    super.key,
    required this.resources,
    required this.numbers,
    this.settlements = const [],
    this.roads = const [],
    this.cities = const [],
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

      return SizedBox(
        width: hexagonWidth * 5,
        height: hexagonHeight * 4,
        child: Transform.translate(
          offset: Offset(hexagonWidth, 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ResourcesWidget(
                hexagonWidth: hexagonWidth,
                hexagonHeight: hexagonHeight,
                horizontalShift: horizontalShift,
                verticalShift: verticalShift,
                resources: resources,
              ),
              ResourceNumbersWidget(
                hexagonWidth: hexagonWidth,
                hexagonHeight: hexagonHeight,
                horizontalShift: horizontalShift,
                verticalShift: verticalShift,
                numbers: numbers,
              ),
              RoadsWidget(
                hexagonWidth: hexagonWidth,
                hexagonHeight: hexagonHeight,
                roads: roads,
              ),
              SettlementsWidget(
                hexagonWidth: hexagonWidth,
                hexagonHeight: hexagonHeight,
                settlements: settlements,
              ),
              CitiesWidget(
                hexagonWidth: hexagonWidth,
                hexagonHeight: hexagonHeight,
                cities: cities,
              )
            ],
          ),
        ),
      );
    });
  }
}
