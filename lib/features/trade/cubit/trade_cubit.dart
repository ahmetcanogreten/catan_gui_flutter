import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'trade_state.dart';

class TradeCubit extends Cubit<TradeState> {
  final IGameRepository _gameRepository;
  TradeCubit()
      : _gameRepository = GetIt.I.get<IGameRepository>(),
        super(TradeInitial());

  void createTradeOffer({
    required int gameId,
    required int wantHills,
    required int wantForest,
    required int wantMountains,
    required int wantFields,
    required int wantPasture,
    required int giveHills,
    required int giveForest,
    required int giveMountains,
    required int giveFields,
    required int givePasture,
  }) async {
    await _gameRepository.createTradeOffer(
        gameId: gameId,
        wantHills: wantHills,
        wantForest: wantForest,
        wantMountains: wantMountains,
        wantFields: wantFields,
        wantPasture: wantPasture,
        giveHills: giveHills,
        giveForest: giveForest,
        giveMountains: giveMountains,
        giveFields: giveFields,
        givePasture: givePasture);
  }

  void acceptTradeOffer({required int gameId, required String userId}) async {
    await _gameRepository.acceptTradeOffer(gameId: gameId, userId: userId);
  }

  void cancelTradeOffer({required int gameId}) async {
    await _gameRepository.cancelTradeOffer(gameId: gameId);
  }
}
