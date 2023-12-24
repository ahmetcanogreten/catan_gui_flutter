import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/choose_settlement_and_road/cubit/choose_settlement_and_road_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/game/models/resource.dart';
import 'package:catan_gui_flutter/features/game/util/get_user_color.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ChooseSettlementAndRoadCatanBoard extends StatefulWidget {
  final List<ResourceType> resources;
  final List<int> numbers;
  final List<BuildingWithColor> settlements;
  final List<BuildingWithColor> roads;
  final List<BuildingWithColor> cities;

  const ChooseSettlementAndRoadCatanBoard({
    super.key,
    required this.resources,
    required this.numbers,
    required this.settlements,
    required this.roads,
    required this.cities,
  });

  @override
  State<ChooseSettlementAndRoadCatanBoard> createState() =>
      _ChooseSettlementAndRoadCatanBoardState();
}

class _ChooseSettlementAndRoadCatanBoardState
    extends State<ChooseSettlementAndRoadCatanBoard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final userCycle = (state as GameLoaded).game.usersCycle;
        final userId =
            (GetIt.I.get<AuthenticationCubit>().state as LoggedIn).user.id;

        final indexOfUser = userCycle.indexOf(userId);

        final color = getUserColor(indexOfUser);

        return BlocProvider(
          create: (context) => ChooseSettlementAndRoadCubit(
              gameId: (state as GameLoaded).game.id,
              userId: (GetIt.I.get<AuthenticationCubit>().state as LoggedIn)
                  .user
                  .id)
            ..loadAvailableSettlementsAndRoadsToChoose(),
          child: Builder(builder: (context) {
            return BlocBuilder<ChooseSettlementAndRoadCubit,
                ChooseSettlementAndRoadState>(
              builder: (context, state) {
                if (state is AvailableSettlementsToChooseLoaded) {
                  return CatanBoard(
                    resources: widget.resources,
                    numbers: widget.numbers,
                    settlements: widget.settlements,
                    roads: widget.roads,
                    cities: widget.cities,
                    canBeSelectedSettlements: state.availableSettlementsToChoose
                        .map((settlement) =>
                            BuildingWithColor(index: settlement, color: color))
                        .toList(),
                  );
                } else if (state is AvailableRoadsToChooseLoaded) {
                  return CatanBoard(
                      resources: widget.resources,
                      numbers: widget.numbers,
                      settlements: widget.settlements,
                      roads: widget.roads,
                      cities: widget.cities,
                      canBeSelectedRoads: state.availableRoadsToChoose
                          .map((road) =>
                              BuildingWithColor(index: road, color: color))
                          .toList());
                } else {
                  return CircularProgressIndicator(
                      color: Colors.orange.shade100);
                }
              },
            );
          }),
        );
      },
    );
  }
}
