import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'choose_settlement_and_road_state.dart';

class ChooseSettlementAndRoadCubit extends Cubit<ChooseSettlementAndRoadState> {
  final IGameRepository _gameRepository;

  Map<int, List<int>> availableSettlementsAndRoadsToChoose = {};

  final int gameId;
  final String userId;

  ChooseSettlementAndRoadCubit({
    required this.gameId,
    required this.userId,
  })  : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(ChooseSettlementAndRoadInitial());

  void loadAvailableSettlementsAndRoadsToChoose() async {
    availableSettlementsAndRoadsToChoose =
        await _gameRepository.loadAvailableSettlementsAndRoadsToChoose(
      gameId: gameId,
      userId: userId,
    );

    List<int> availableSettlements = [];

    availableSettlementsAndRoadsToChoose.forEach((key, value) {
      availableSettlements.add(key);
    });

    emit(
      AvailableSettlementsToChooseLoaded(
        availableSettlementsToChoose: availableSettlements,
      ),
    );
  }

  void chooseSettlement({required int settlementIndex}) async {
    await _gameRepository.chooseSettlement(
      settlementIndex: settlementIndex,
      gameId: gameId,
      userId: userId,
    );

    emit(
      AvailableRoadsToChooseLoaded(
        availableRoadsToChoose:
            availableSettlementsAndRoadsToChoose[settlementIndex]!,
      ),
    );
  }

  void chooseRoad({required int roadIndex}) async {
    await _gameRepository.chooseRoad(
      roadIndex: roadIndex,
      gameId: gameId,
      userId: userId,
    );
  }
}
