import 'package:equatable/equatable.dart';

class UserOptions extends Equatable {
  final List<int> availableRoads;
  final List<int> availableSettlements;
  final List<int> availableCities;

  const UserOptions({
    required this.availableRoads,
    required this.availableSettlements,
    required this.availableCities,
  });

  @override
  List<Object> get props => [
        availableRoads,
        availableSettlements,
        availableCities,
      ];

  static UserOptions fromJson(Map<String, dynamic> json) {
    return UserOptions(
      availableRoads: (json['availableRoads'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      availableSettlements: (json['availableSettlements'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      availableCities: (json['availableCities'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );
  }
}
