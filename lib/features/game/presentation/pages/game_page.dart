import 'dart:math';

import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/game/models/game_state_model.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/dice.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/in_game_player_entry.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

Color getUserColor(int index) {
  switch (index) {
    case 0:
      return Colors.red.shade900;
    case 1:
      return Colors.blue.shade900;
    case 2:
      return Colors.green.shade900;
    case 3:
      return Colors.yellow.shade900;
    default:
      return Colors.white;
  }
}

class GamePage extends StatefulWidget {
  final int gameId;
  const GamePage({super.key, required this.gameId});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isMyTurn = false;
  bool _isRolling = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return BlocProvider(
        create: (context) =>
            GameCubit()..startGetGameStateTimer(gameId: widget.gameId),
        child: BlocListener<GameCubit, GameState>(
          listener: (context, state) {
            if (state is GameLoaded) {
              final userId =
                  (GetIt.I.get<AuthenticationCubit>().state as LoggedIn)
                      .user
                      .id;
              setState(() {
                _isMyTurn = state.gameStateModel.turnUser.id == userId;
              });

              if (_isRolling && state.gameStateModel.turnUser.id != userId) {
                setState(() {
                  _isRolling = false;
                });
              }
            }
          },
          child: CATScaffold(
            body: Stack(fit: StackFit.expand, children: [
              Assets.images.catanBackground.image(fit: BoxFit.cover),
              Container(
                  padding: EdgeInsets.all(maxSize * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: BlocBuilder<GameCubit, GameState>(
                    builder: (context, state) {
                      if (state is! GameLoaded) {
                        return Center(
                            child: SizedBox(
                          width: maxSize * 0.25,
                          height: maxSize * 0.25,
                          child: CircularProgressIndicator(
                            strokeWidth: maxSize * 0.01,
                            color: Colors.orange.shade100,
                          ),
                        ));
                      }

                      final resources = [...state.game.resources];
                      resources.sort((a, b) => a.index.compareTo(b.index));

                      final orderedResourceTypes = resources.map((e) => e.type);

                      final orderedResourceNumbers =
                          resources.map((e) => e.number);

                      final users = state.game.users;
                      final usersCycle = state.game.usersCycle;
                      final turnUser = state.gameStateModel.turnUser;
                      final turnState = state.gameStateModel.turnState;

                      final userStates = state.userStates;

                      List<BuildingWithColor> settlements = [];
                      List<BuildingWithColor> cities = [];
                      List<BuildingWithColor> roads = [];

                      for (final userState in userStates) {
                        final user = userState.user;
                        final buildings = userState.buildings;
                        final index = usersCycle.indexOf(user.id);

                        final userSettlements = buildings['settlement']
                            .map((e) => BuildingWithColor(
                                index: e, color: getUserColor(index)))
                            .toList();
                        final userCities = buildings['city']
                            .map((e) => BuildingWithColor(
                                index: e, color: getUserColor(index)))
                            .toList();
                        final userRoads = buildings['road']
                            .map((e) => BuildingWithColor(
                                index: e, color: getUserColor(index)))
                            .toList();

                        settlements = [...settlements, ...userSettlements];
                        cities = [...cities, ...userCities];
                        roads = [...roads, ...userRoads];
                      }

                      return Padding(
                        padding: EdgeInsets.all(maxSize * 0.1 * 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BlocBuilder<GameCubit, GameState>(
                                builder: (context, state) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: maxSize * 0.02,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child:
                                                usersCycle[index] == turnUser.id
                                                    ? const FittedBox(
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: InGamePlayerEntry(
                                              color: getUserColor(index),
                                              user: users.firstWhere(
                                                  (element) =>
                                                      element.id ==
                                                      usersCycle[index]),
                                              userState: userStates.firstWhere(
                                                  (element) =>
                                                      element.user.id ==
                                                      usersCycle[index]),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: usersCycle.length,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: maxSize * 0.05),
                            Expanded(
                                flex: 3,
                                child: CatanBoard(
                                  resources: orderedResourceTypes.toList(),
                                  numbers: orderedResourceNumbers.toList(),
                                  settlements: settlements,
                                )),
                            SizedBox(width: maxSize * 0.1),
                            Expanded(
                                child: _isMyTurn
                                    ? Builder(builder: (context) {
                                        switch (turnState) {
                                          case TurnState.roll:
                                            if (_isRolling) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: maxSize * 0.1,
                                                    height: maxSize * 0.1,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth:
                                                          maxSize * 0.01,
                                                      color: Colors
                                                          .orange.shade100,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  Text(
                                                    'Rolling',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .orange.shade100,
                                                        fontSize:
                                                            maxSize * 0.02),
                                                  ),
                                                ],
                                              );
                                            }
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: maxSize * 0.1,
                                                    width: maxSize * 0.1,
                                                    child: CATElevatedButton(
                                                        backgroundColor: Colors
                                                            .orange.shade100,
                                                        foregroundColor: Colors
                                                            .orange.shade500,
                                                        onPressed: () {
                                                          setState(() {
                                                            _isRolling = true;
                                                          });

                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 2),
                                                              () {
                                                            final dice1 =
                                                                Random().nextInt(
                                                                        6) +
                                                                    1;
                                                            final dice2 =
                                                                Random().nextInt(
                                                                        6) +
                                                                    1;

                                                            final userId = (GetIt
                                                                        .I
                                                                        .get<
                                                                            AuthenticationCubit>()
                                                                        .state
                                                                    as LoggedIn)
                                                                .user
                                                                .id;

                                                            context
                                                                .read<
                                                                    GameCubit>()
                                                                .sendRollDice(
                                                                    gameId: widget
                                                                        .gameId,
                                                                    dice1:
                                                                        dice1,
                                                                    dice2:
                                                                        dice2,
                                                                    userId:
                                                                        userId);
                                                          });
                                                        },
                                                        child: Text(
                                                          "Roll",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  maxSize *
                                                                      0.02),
                                                        ))),
                                              ],
                                            );

                                          case TurnState.build:
                                            final dice1 = state
                                                .gameStateModel.dice1 as int;
                                            final dice2 = state
                                                .gameStateModel.dice2 as int;
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: maxSize * 0.1,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          width: maxSize * 0.1,
                                                          child: Dice(
                                                              value: dice1),
                                                        ),
                                                        SizedBox(
                                                          width: maxSize * 0.1,
                                                          child: Dice(
                                                              value: dice2),
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    height: maxSize * 0.02),
                                                CATElevatedButton(
                                                  backgroundColor:
                                                      Colors.orange.shade100,
                                                  foregroundColor:
                                                      Colors.orange.shade500,
                                                  onPressed: () {
                                                    // TODO : Send end turn message to server
                                                    // setState(() {
                                                    //   _isMyTurn = false;
                                                    //   _turnState =
                                                    //       TurnState.initial;
                                                    // });
                                                  },
                                                  child: Text(
                                                    "End Turn",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            maxSize * 0.02),
                                                  ),
                                                ),
                                              ],
                                            );
                                        }
                                      })
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: maxSize * 0.1,
                                            height: maxSize * 0.1,
                                            child: CircularProgressIndicator(
                                              strokeWidth: maxSize * 0.01,
                                              color: Colors.orange.shade100,
                                            ),
                                          ),
                                          SizedBox(height: maxSize * 0.02),
                                          Text(
                                            'Wait for your turn',
                                            style: TextStyle(
                                                color: Colors.orange.shade100,
                                                fontSize: maxSize * 0.02),
                                          ),
                                        ],
                                      )),
                          ],
                        ),
                      );
                    },
                  ))
            ]),
          ),
        ),
      );
    });
  }
}
