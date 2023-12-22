import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/city_widget.dart';
import 'package:flutter/material.dart';

class ConditionalCityWidget extends StatelessWidget {
  final List<BuildingWithColor> cities;
  final int index;
  const ConditionalCityWidget({
    super.key,
    required this.cities,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return cities.any((element) => element.index == index)
        ? CityWidget(
            color: cities.firstWhere((element) => element.index == index).color)
        : const SizedBox.shrink();
  }
}
