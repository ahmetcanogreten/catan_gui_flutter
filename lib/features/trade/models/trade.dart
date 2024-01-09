import 'package:equatable/equatable.dart';

class Trade extends Equatable {
  final int id;

  final int wantHills;
  final int wantForest;
  final int wantMountains;
  final int wantFields;
  final int wantPasture;

  final int giveHills;
  final int giveForest;
  final int giveMountains;
  final int giveFields;
  final int givePasture;

  const Trade({
    required this.id,
    required this.wantHills,
    required this.wantForest,
    required this.wantMountains,
    required this.wantFields,
    required this.wantPasture,
    required this.giveHills,
    required this.giveForest,
    required this.giveMountains,
    required this.giveFields,
    required this.givePasture,
  });

  @override
  List<Object> get props => [
        id,
        wantHills,
        wantForest,
        wantMountains,
        wantFields,
        wantPasture,
        giveHills,
        giveForest,
        giveMountains,
        giveFields,
        givePasture,
      ];

  static Trade fromJson(Map<String, dynamic> json) {
    return Trade(
      id: json['id'] as int,
      wantHills: json['wantHills'] as int,
      wantForest: json['wantForest'] as int,
      wantMountains: json['wantMountains'] as int,
      wantFields: json['wantFields'] as int,
      wantPasture: json['wantPasture'] as int,
      giveHills: json['giveHills'] as int,
      giveForest: json['giveForest'] as int,
      giveMountains: json['giveMountains'] as int,
      giveFields: json['giveFields'] as int,
      givePasture: json['givePasture'] as int,
    );
  }
}
