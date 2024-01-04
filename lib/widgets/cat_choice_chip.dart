import 'package:flutter/material.dart';

class CATChoiceChip extends StatelessWidget {
  final String label;
  final Function(bool)? onSelected;
  final bool isSelected;
  const CATChoiceChip({
    super.key,
    required this.label,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        backgroundColor: Colors.orange.shade100,
        selectedColor: Colors.orange.shade300,
        selected: isSelected,
        onSelected: onSelected,
        label: Text(label, style: const TextStyle(color: Colors.black)));
  }
}
