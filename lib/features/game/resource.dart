import 'package:equatable/equatable.dart';

enum ResourceType { fields, forest, hills, mountains, pasture, desert }

class Resource extends Equatable {
  final int index;
  final ResourceType type;
  final int number;

  const Resource({
    required this.index,
    required this.type,
    required this.number,
  });

  @override
  List<Object?> get props => [
        index,
        type,
        number,
      ];
}
