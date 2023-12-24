import 'dart:math';

import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/conditional_rotated_road_widget.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/on_edges_widget.dart';
import 'package:flutter/material.dart';

class CanBeBoughtRoadsWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final List<BuildingWithColor> roads;
  const CanBeBoughtRoadsWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.roads,
  });

  @override
  Widget build(BuildContext context) {
    return OnEdgesWidget(
        hexagonWidth: hexagonWidth,
        hexagonHeight: hexagonHeight,
        children: [
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 0, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 1, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 2, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 3, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 4, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 5, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 6, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 7, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 8, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 9, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 10, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 11, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 12, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 13, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 14, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 15, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 16, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 17, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 18, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 19, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 20, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 21, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 22, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 23, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 24, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 25, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 26, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 27, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 28, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 29, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 30, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 31, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 32, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 33, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 34, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 35, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 36, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 37, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 38, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 39, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 40, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 41, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 42, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 43, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 44, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 45, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 46, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 47, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 48, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 49, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 50, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 51, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 52, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 53, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 54, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 55, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 56, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 57, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 58, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 59, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 60, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 61, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 62, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 63, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 64, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 65, angle: -3 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 66, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 67, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 68, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 69, angle: -1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 70, angle: 1 * pi / 6),
          ConditionalRotatedRoadWidget(
              canBeBought: true, roads: roads, index: 71, angle: -1 * pi / 6),
        ]);
  }
}
