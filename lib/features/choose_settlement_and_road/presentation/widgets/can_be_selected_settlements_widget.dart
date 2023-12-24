import 'package:catan_gui_flutter/features/choose_settlement_and_road/presentation/widgets/selectable_settlement_widget.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/on_vertices_widget.dart';
import 'package:flutter/material.dart';

class CanBeSelectedSettlementsWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final List<BuildingWithColor> canBeSelectedSettlements;

  const CanBeSelectedSettlementsWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.canBeSelectedSettlements,
  });

  @override
  Widget build(BuildContext context) {
    return OnVerticesWidget(
        hexagonWidth: hexagonWidth,
        hexagonHeight: hexagonHeight,
        children: [for (int i = 0; i < 54; i++) i]
            .map((index) => SelectableSettlementWidget(
                settlements: canBeSelectedSettlements, index: index))
            .toList());
  }
}
