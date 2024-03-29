import 'dart:async';
import 'dart:math';

import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/game/models/game_state_model.dart';
import 'package:catan_gui_flutter/features/choose_settlement_and_road/presentation/widgets/choose_settlement_and_road_catan_board.dart';
import 'package:catan_gui_flutter/features/game/models/resource.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/dice.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/in_game_player_entry.dart';
import 'package:catan_gui_flutter/features/trade/presentation/widgets/trade_widget.dart';
import 'package:catan_gui_flutter/features/game/util/get_user_color.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/resources_widget.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:catan_gui_flutter/widgets/cat_text_button.dart';
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

  bool _isBuildingCostsShown = false;

  bool _isGameLogsRealTime = true;

  final _gameLogsScrollController = ScrollController();

  @override
  void dispose() {
    _gameLogsScrollController.dispose();
    super.dispose();
  }

  _scrollToBottom() {
    _gameLogsScrollController.animateTo(
        _gameLogsScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut);
  }

  Future<void> showWinnerDialog({required User winner}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
              final maxSize = constraints.maxWidth > constraints.maxHeight
                  ? constraints.maxHeight
                  : constraints.maxWidth;

              return Dialog(
                backgroundColor: Colors.orange.shade100,
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.emoji_events_rounded,
                        size: maxSize * 0.1,
                        color: Colors.orange.shade500,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Game Finished',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${winner.firstName} ${winner.lastName} won the game',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CATTextButton(
                        backgroundColor: Colors.orange.shade100,
                        foregroundColor: Colors.orange.shade500,
                        onPressed: () {
                          context.pop();
                          context.go(homeRoute);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Go to Home'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

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
            } else if (state is GameFinished) {
              showWinnerDialog(winner: state.winner);
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

                      final usersWithInGamePoints = state.usersWithInGamePoints;

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
                                              userWithInGamePoints:
                                                  usersWithInGamePoints
                                                      .firstWhere((element) =>
                                                          element.id ==
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
                            SizedBox(width: maxSize * 0.05),
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
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
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                          backgroundColor:
                                                              Colors.orange
                                                                  .shade100,
                                                          foregroundColor:
                                                              Colors.orange
                                                                  .shade500,
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
                                                                color: Colors
                                                                    .black,
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
                                                            width:
                                                                maxSize * 0.1,
                                                            child: Dice(
                                                                value: dice1),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                maxSize * 0.1,
                                                            child: Dice(
                                                                value: dice2),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  const TradeWidget(),
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
                                                      strokeWidth:
                                                          maxSize * 0.01,
                                                      color: Colors
                                                          .orange.shade100,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  Text(
                                                    '${turnUser.firstName} is choosing settlement and road',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .orange.shade100,
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                      strokeWidth:
                                                          maxSize * 0.01,
                                                      color: Colors
                                                          .orange.shade100,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  Text(
                                                    '${turnUser.firstName} is choosing settlement and road',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .orange.shade100,
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                      strokeWidth:
                                                          maxSize * 0.01,
                                                      color: Colors
                                                          .orange.shade100,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  Text(
                                                    '${turnUser.firstName} is rolling',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .orange.shade100,
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                        fontSize:
                                                            maxSize * 0.02),
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
                                                            width:
                                                                maxSize * 0.1,
                                                            child: Dice(
                                                                value: dice1),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                maxSize * 0.1,
                                                            child: Dice(
                                                                value: dice2),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      height: maxSize * 0.02),
                                                  const TradeWidget(),
                                                ],
                                              );
                                          }
                                        }),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(maxSize * 0.02),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: BlocBuilder<GameCubit, GameState>(
                                      builder: (context, state) {
                                        final gameLogs =
                                            (state as GameLoaded).gameLogs;

                                        if (_isGameLogsRealTime) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (_) => _scrollToBottom());
                                        }

                                        return Column(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Game Logs',
                                                    style: TextStyle(
                                                      fontSize: maxSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .orange.shade100,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  _isGameLogsRealTime
                                                      ? IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _isGameLogsRealTime =
                                                                  false;
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.refresh,
                                                            color: Colors.orange
                                                                .shade100,
                                                          ))
                                                      : IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _isGameLogsRealTime =
                                                                  true;
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward_rounded,
                                                            color: Colors.orange
                                                                .shade100,
                                                          ))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: maxSize * 0.02),
                                            Expanded(
                                              flex: 10,
                                              child: ListView.separated(
                                                controller:
                                                    _gameLogsScrollController,
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: maxSize * 0.01),
                                                  height: maxSize * 0.001,
                                                  color: Colors.orange.shade100,
                                                ),
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                        child: Center(
                                                          child: Text(
                                                            (index + 1)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .orange
                                                                    .shade100,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 6,
                                                        child: Text(
                                                          gameLogs[index].log,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .orange
                                                                  .shade100,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount: gameLogs.length,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                      );
                    },
                  )),
              Positioned(
                  right: maxSize * 0.02,
                  top: maxSize * 0.02,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        MouseRegion(
                          onHover: (event) {
                            setState(() {
                              _isBuildingCostsShown = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              _isBuildingCostsShown = false;
                            });
                          },
                          child: IconButton(
                              iconSize: maxSize * 0.05,
                              color: Colors.blue,
                              icon: Padding(
                                padding: EdgeInsets.all(maxSize * 0.01),
                                child: const Icon(Icons.info_outline),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isBuildingCostsShown = true;
                                });
                              }),
                        ),
                        IconButton(
                            iconSize: maxSize * 0.05,
                            color: Colors.red.shade900,
                            icon: Padding(
                              padding: EdgeInsets.all(maxSize * 0.01),
                              child: const Icon(Icons.logout_rounded),
                            ),
                            onPressed: () {
                              context.go(homeRoute);
                            }),
                      ],
                    ),
                  )),
              if (_isBuildingCostsShown)
                Positioned(
                    right: maxSize * 0.02,
                    top: maxSize * 0.12,
                    child: Container(
                      width: maxSize * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(maxSize * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Building Costs',
                            style: TextStyle(
                              fontSize: maxSize * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: maxSize * 0.02),
                          Text('Road',
                              style: TextStyle(
                                fontSize: maxSize * 0.02,
                              )),
                          Row(
                            children: [
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.forest)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.hills)),
                              const Expanded(child: SizedBox.shrink()),
                              Text('0 VP',
                                  style: TextStyle(
                                    fontSize: maxSize * 0.02,
                                  )),
                            ],
                          ),
                          Text('Settlement',
                              style: TextStyle(
                                fontSize: maxSize * 0.02,
                              )),
                          Row(
                            children: [
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.forest)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.hills)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.fields)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child:
                                      getResourceImage(ResourceType.pasture)),
                              const Expanded(child: SizedBox.shrink()),
                              Text('1 VP',
                                  style: TextStyle(
                                    fontSize: maxSize * 0.02,
                                  )),
                            ],
                          ),
                          Text('City',
                              style: TextStyle(
                                fontSize: maxSize * 0.02,
                              )),
                          Row(
                            children: [
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.fields)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child: getResourceImage(ResourceType.fields)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child:
                                      getResourceImage(ResourceType.mountains)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child:
                                      getResourceImage(ResourceType.mountains)),
                              SizedBox(
                                  width: maxSize * 0.05,
                                  height: maxSize * 0.05,
                                  child:
                                      getResourceImage(ResourceType.mountains)),
                              const Expanded(child: SizedBox.shrink()),
                              Text('2 VP',
                                  style: TextStyle(
                                    fontSize: maxSize * 0.02,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
            ]),
          ),
        ),
      );
    });
  }
}
