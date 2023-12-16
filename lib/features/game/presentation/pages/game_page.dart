import 'dart:math';

import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/dice.dart';
import 'package:catan_gui_flutter/features/game/presentation/widgets/in_game_player_entry.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum TurnState { initial, rolling, build }

class GamePage extends StatefulWidget {
  final int gameId;
  const GamePage({super.key, required this.gameId});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isMyTurn = true;
  TurnState _turnState = TurnState.initial;
  List<int> _diceValues = [6, 6];

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
            if (state is GameLoaded && !_isMyTurn) {
              final userId =
                  (GetIt.I.get<AuthenticationCubit>().state as LoggedIn)
                      .user
                      .id;

              setState(() {
                _isMyTurn = state.game.gameState.turnPlayer.id == userId;
              });
            }
          },
          child: CATScaffold(
            body: Stack(fit: StackFit.expand, children: [
              Assets.images.catanBackground.image(fit: BoxFit.cover),
              Container(
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

                      final players = state.game.players;
                      final turnPlayer = state.game.gameState.turnPlayer;

                      return Padding(
                        padding: EdgeInsets.all(maxSize * 0.1),
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<GameCubit, GameState>(
                                builder: (context, state) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: maxSize * 0.02,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InGamePlayerEntry(
                                        isTurnPlayer:
                                            players[index] == turnPlayer,
                                        user: players[index],
                                        numberOfBricks: 1,
                                        numberOfWool: 2,
                                        numberOfOre: 3,
                                        numberOfGrain: 4,
                                        numberOfLumber: 5,
                                      );
                                    },
                                    itemCount: 2,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: maxSize * 0.1),
                            Expanded(
                                flex: 2,
                                child: CatanBoard(
                                  resources: orderedResourceTypes.toList(),
                                  numbers: orderedResourceNumbers.toList(),
                                )),
                            SizedBox(width: maxSize * 0.1),
                            Expanded(
                                child: _isMyTurn
                                    ? Builder(builder: (context) {
                                        switch (_turnState) {
                                          case TurnState.initial:
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
                                                            _turnState =
                                                                TurnState
                                                                    .rolling;
                                                          });

                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 2),
                                                              () {
                                                            setState(() {
                                                              _diceValues = [
                                                                Random().nextInt(
                                                                        6) +
                                                                    1,
                                                                Random().nextInt(
                                                                        6) +
                                                                    1
                                                              ];

                                                              _turnState =
                                                                  TurnState
                                                                      .build;
                                                            });
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
                                          case TurnState.rolling:
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
                                                  'Rolling',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize: maxSize * 0.02),
                                                ),
                                              ],
                                            );
                                          case TurnState.build:
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
                                                              value: _diceValues
                                                                  .first),
                                                        ),
                                                        SizedBox(
                                                          width: maxSize * 0.1,
                                                          child: Dice(
                                                              value: _diceValues
                                                                  .last),
                                                        ),
                                                        Text(
                                                          '=',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .orange
                                                                  .shade100,
                                                              fontSize:
                                                                  maxSize *
                                                                      0.05),
                                                        ),
                                                        SizedBox(
                                                          width: maxSize * 0.1,
                                                          child: Dice(
                                                              value: _diceValues
                                                                  .last),
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
                                                    setState(() {
                                                      _isMyTurn = false;
                                                      _turnState =
                                                          TurnState.initial;
                                                    });
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
