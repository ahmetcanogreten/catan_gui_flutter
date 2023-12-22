import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/road_widget.dart';
import 'package:flutter/material.dart';

class ConditionalRotatedRoadWidget extends StatelessWidget {
  final List<BuildingWithColor> roads;
  final int index;
  final double angle;
  const ConditionalRotatedRoadWidget({
    super.key,
    required this.roads,
    required this.index,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return roads.any((element) => element.index == index)
        ? Transform.rotate(
            angle: angle,
            child: RoadWidget(
                color: roads
                    .firstWhere((element) => element.index == index)
                    .color),
          )
        : const SizedBox.shrink();
  }
}
