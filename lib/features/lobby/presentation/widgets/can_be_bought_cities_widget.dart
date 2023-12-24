import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/conditional_cities_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/on_vertices_widget.dart';
import 'package:flutter/material.dart';

class CanBeBoughtCitiesWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final List<BuildingWithColor> canBeBoughtCities;

  const CanBeBoughtCitiesWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.canBeBoughtCities,
  });

  @override
  Widget build(BuildContext context) {
    return OnVerticesWidget(
        hexagonWidth: hexagonWidth,
        hexagonHeight: hexagonHeight,
        children: [for (int i = 0; i < 54; i++) i]
            .map((index) => ConditionalCityWidget(
                canBeBought: true, cities: canBeBoughtCities, index: index))
            .toList());
  }
}
