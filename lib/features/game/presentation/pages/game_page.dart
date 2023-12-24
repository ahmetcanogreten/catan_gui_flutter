import 'dart:math';

import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/game/models/game_state_model.dart';
import 'package:catan_gui_flutter/features/choose_settlement_and_road/presentation/widgets/choose_settlement_and_road_catan_board.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/dice.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/in_game_player_entry.dart';
import 'package:catan_gui_flutter/features/game/util/get_user_color.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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
                      final myIndex = usersCycle.indexWhere((id) =>
                          id ==
                          (GetIt.I.get<AuthenticationCubit>().state as LoggedIn)
                              .user
                              .id);

                      final myUserState = userStates.firstWhere((element) =>
                          element.user.id ==
                          (GetIt.I.get<AuthenticationCubit>().state as LoggedIn)
                              .user
                              .id);

                      List<BuildingWithColor> settlements = [];
                      List<BuildingWithColor> cities = [];
                      List<BuildingWithColor> roads = [];

                      for (final userState in userStates) {
                        final user = userState.user;
                        final index = usersCycle.indexOf(user.id);

                        final userSettlements = userState.settlements
                            .map((e) => BuildingWithColor(
                                index: e, color: getUserColor(index)))
                            .toList();
                        final userCities = userState.cities
                            .map((e) => BuildingWithColor(
                                index: e, color: getUserColor(index)))
                            .toList();
                        final userRoads = userState.roads
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
                                child: Builder(builder: (context) {
                                  if (_isMyTurn &&
                                      (turnState == TurnState.choose_1 ||
                                          turnState == TurnState.choose_2)) {
                                    return ChooseSettlementAndRoadCatanBoard(
                                      resources: orderedResourceTypes.toList(),
                                      numbers: orderedResourceNumbers.toList(),
                                      settlements: settlements,
                                      roads: roads,
                                      cities: cities,
                                    );
                                  }

                                  return CatanBoard(
                                    resources: orderedResourceTypes.toList(),
                                    numbers: orderedResourceNumbers.toList(),
                                    settlements: settlements,
                                    roads: roads,
                                    cities: cities,
                                    availableSettlements: (_isMyTurn &&
                                            turnState == TurnState.build &&
                                            myUserState.numberOfLumber >= 1 &&
                                            myUserState.numberOfBricks >= 1 &&
                                            myUserState.numberOfWool >= 1 &&
                                            myUserState.numberOfGrain >= 1)
                                        ? state.userOptions.availableSettlements
                                            .map((e) => BuildingWithColor(
                                                index: e,
                                                color: getUserColor(myIndex)))
                                            .toList()
                                        : [],
                                    availableRoads: (_isMyTurn &&
                                            turnState == TurnState.build &&
                                            myUserState.numberOfLumber >= 1 &&
                                            myUserState.numberOfBricks >= 1)
                                        ? state.userOptions.availableRoads
                                            .map((e) => BuildingWithColor(
                                                index: e,
                                                color: getUserColor(myIndex)))
                                            .toList()
                                        : [],
                                    availableCities: (_isMyTurn &&
                                            turnState == TurnState.build &&
                                            myUserState.numberOfGrain >= 2 &&
                                            myUserState.numberOfOre >= 3)
                                        ? state.userOptions.availableCities
                                            .map((e) => BuildingWithColor(
                                                index: e,
                                                color: getUserColor(myIndex)))
                                            .toList()
                                        : [],
                                  );
                                })),
                            SizedBox(width: maxSize * 0.1),
                            Expanded(
                                child: _isMyTurn
                                    ? Builder(builder: (context) {
                                        switch (turnState) {
                                          case TurnState.choose_1:
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Choose your first settlement and road',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            );
                                          case TurnState.choose_2:
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Choose your second settlement and road',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            );
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
                                                    context
                                                        .read<GameCubit>()
                                                        .endTurn(
                                                            gameId:
                                                                widget.gameId,
                                                            userId: (GetIt.I
                                                                        .get<
                                                                            AuthenticationCubit>()
                                                                        .state
                                                                    as LoggedIn)
                                                                .user
                                                                .id);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Text(
                                                      "End Turn",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              maxSize * 0.02),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                        }
                                      })
                                    : Builder(builder: (context) {
                                        switch (turnState) {
                                          case TurnState.choose_1:
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: maxSize * 0.1,
                                                  height: maxSize * 0.1,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: maxSize * 0.01,
                                                    color:
                                                        Colors.orange.shade100,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: maxSize * 0.02),
                                                Text(
                                                  '${turnUser.firstName} is choosing settlement and road',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                ),
                                              ],
                                            );
                                          case TurnState.choose_2:
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: maxSize * 0.1,
                                                  height: maxSize * 0.1,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: maxSize * 0.01,
                                                    color:
                                                        Colors.orange.shade100,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: maxSize * 0.02),
                                                Text(
                                                  '${turnUser.firstName} is choosing settlement and road',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                ),
                                              ],
                                            );
                                          case TurnState.roll:
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: maxSize * 0.1,
                                                  height: maxSize * 0.1,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: maxSize * 0.01,
                                                    color:
                                                        Colors.orange.shade100,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: maxSize * 0.02),
                                                Text(
                                                  '${turnUser.firstName} is rolling',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                ),
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
                                                Text(
                                                  '${turnUser.firstName} rolled',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                ),
                                                SizedBox(
                                                    height: maxSize * 0.02),
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
                                              ],
                                            );
                                        }
                                      })),
                          ],
                        ),
                      );
                    },
                  )),
              Positioned(
                  right: maxSize * 0.02,
                  top: maxSize * 0.02,
                  child: IconButton(
                      iconSize: maxSize * 0.05,
                      color: Colors.white,
                      icon: const Icon(Icons.logout_rounded),
                      onPressed: () {
                        context.go(homeRoute);
                      }))
            ]),
          ),
        ),
      );
    });
  }
}
