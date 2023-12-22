import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BuildingWithColor extends Equatable {
  final int index;
  final Color color;

  const BuildingWithColor({
    required this.index,
    required this.color,
  });

  @override
  List<Object?> get props => [
        index,
        color,
      ];
}
