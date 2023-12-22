import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/settlement_widget.dart';
import 'package:flutter/material.dart';

class ConditionalSettlementWidget extends StatelessWidget {
  final List<BuildingWithColor> settlements;
  final int index;
  const ConditionalSettlementWidget({
    super.key,
    required this.settlements,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return settlements.any((element) => element.index == index)
        ? SettlementWidget(
            color: settlements
                .firstWhere((element) => element.index == index)
                .color)
        : const SizedBox.shrink();
  }
}
