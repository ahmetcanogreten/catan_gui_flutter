import 'package:catan_gui_flutter/features/game/models/resource.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/can_be_bought_cities_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/can_be_bought_roads_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/can_be_bought_settlements_widget.dart';
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

  final List<BuildingWithColor> availableSettlements;
  final List<BuildingWithColor> availableRoads;
  final List<BuildingWithColor> availableCities;

  const CatanBoard({
    super.key,
    required this.resources,
    required this.numbers,
    this.settlements = const [],
    this.roads = const [],
    this.cities = const [],
    this.availableSettlements = const [],
    this.availableRoads = const [],
    this.availableCities = const [],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      final hexagonHeight = maxSize * 0.2;
      final hexagonWidth = hexagonHeight / 2 * 1.732050808;

      final verticalShift = hexagonHeight * 0.75;
      final horizontalShift = hexagonWidth;

      return Stack(
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
          ),
          CanBeBoughtRoadsWidget(
            hexagonWidth: hexagonWidth,
            hexagonHeight: hexagonHeight,
            roads: availableRoads,
          ),
          CanBeBoughtSettlementsWidget(
            hexagonWidth: hexagonWidth,
            hexagonHeight: hexagonHeight,
            canBeBoughtSettlements: availableSettlements,
          ),
          CanBeBoughtCitiesWidget(
            hexagonWidth: hexagonWidth,
            hexagonHeight: hexagonHeight,
            canBeBoughtCities: availableCities,
          ),
        ],
      );
    });
  }
}
