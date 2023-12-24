part of 'choose_settlement_and_road_cubit.dart';

sealed class ChooseSettlementAndRoadState extends Equatable {
  const ChooseSettlementAndRoadState();

  @override
  List<Object> get props => [];
}

final class ChooseSettlementAndRoadInitial
    extends ChooseSettlementAndRoadState {}

final class AvailableSettlementsToChooseLoaded
    extends ChooseSettlementAndRoadState {
  final List<int> availableSettlementsToChoose;

  const AvailableSettlementsToChooseLoaded(
      {required this.availableSettlementsToChoose});

  @override
  List<Object> get props => [availableSettlementsToChoose];
}

final class AvailableRoadsToChooseLoaded extends ChooseSettlementAndRoadState {
  final List<int> availableRoadsToChoose;

  const AvailableRoadsToChooseLoaded({required this.availableRoadsToChoose});

  @override
  List<Object> get props => [availableRoadsToChoose];
}
