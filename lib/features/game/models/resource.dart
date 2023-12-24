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

  static Resource fromJson(Map<String, dynamic> json) {
    return Resource(
      index: json['index'] as int,
      type: ResourceType.values.firstWhere(
          (element) => element.toString().split('.').last == json['type']),
      number: json['number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'type': type.toString().split('.').last,
      'number': number,
    };
  }
}
