import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/lobby/cubit/lobby_cubit.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/player_entry.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LobbyCubit()
        ..createRoomAndStartTimer(
            ownerId:
                (GetIt.I.get<AuthenticationCubit>().state as LoggedIn).user.id),
      child: LayoutBuilder(builder: (context, constraints) {
        final maxSize = constraints.maxWidth > constraints.maxHeight
            ? constraints.maxHeight
            : constraints.maxWidth;

        return CATScaffold(
          body: Stack(fit: StackFit.expand, children: [
            Assets.images.catanBackground.image(fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(maxSize * 0.05),
              child: Container(
                  padding: EdgeInsets.all(maxSize * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: BlocBuilder<LobbyCubit, LobbyState>(
                    buildWhen: (previous, current) {
                      return [LobbyLoaded, LobbyCreating]
                          .contains(current.runtimeType);
                    },
                    builder: (context, state) {
                      if (state is! LobbyLoaded) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange.shade100,
                          ),
                        );
                      }

                      final usersInTheRoom = state.room.users;

                      final room = state.room;

                      final resources = [...room.resources];
                      resources.sort((a, b) => a.index.compareTo(b.index));

                      final orderedResourceTypes =
                          resources.map((e) => e.type).toList();

                      final orderedNumbers =
                          resources.map((e) => e.number).toList();

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: maxSize * 0.1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FittedBox(
                                    child: IconButton(
                                      color: Colors.orange.shade100,
                                      icon:
                                          const Icon(Icons.arrow_back_rounded),
                                      onPressed: () {
                                        context.go(homeRoute);
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(height: maxSize * 0.02),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...usersInTheRoom.map((user) {
                                            return Column(
                                              children: [
                                                PlayerEntry(
                                                    name:
                                                        '${user.firstName} ${user.lastName}'),
                                                SizedBox(height: maxSize * 0.01)
                                              ],
                                            );
                                          }),
                                          SizedBox(height: maxSize * 0.02),
                                          if (usersInTheRoom.length < 4) ...[
                                            SizedBox(height: maxSize * 0.02),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  onTap: () {
                                                    context
                                                        .read<LobbyCubit>()
                                                        .addBot();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 32,
                                                        vertical: 16),
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .orange.shade100
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Text('+ Add bot',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: maxSize *
                                                                0.025)),
                                                  )),
                                            ),
                                          ]
                                        ],
                                      )),
                                      SizedBox(
                                        height: maxSize * 0.1,
                                        width: maxSize * 0.2,
                                        child: BlocConsumer<LobbyCubit,
                                            LobbyState>(
                                          listener: (context, state) {
                                            if (state is GameCreated) {
                                              context.go(
                                                gameRoute,
                                                extra: {
                                                  'gameId': state.gameId,
                                                },
                                              );
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is GameCreating) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.orange.shade100,
                                                ),
                                              );
                                            }

                                            return CATElevatedButton(
                                                borderRadius: 16,
                                                backgroundColor:
                                                    Colors.green.shade900,
                                                onPressed: usersInTheRoom
                                                            .length <
                                                        2
                                                    ? null
                                                    : () {
                                                        context
                                                            .read<LobbyCubit>()
                                                            .createGame();
                                                      },
                                                child: Text(
                                                  'Start',
                                                  style: TextStyle(
                                                    color:
                                                        Colors.orange.shade100,
                                                    fontSize: maxSize * 0.04,
                                                  ),
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: CatanBoard(
                                            resources: orderedResourceTypes,
                                            numbers: orderedNumbers),
                                      ),
                                      SizedBox(height: maxSize * 0.05),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {
                                              context
                                                  .read<LobbyCubit>()
                                                  .shuffleResourcesAndNumbers();
                                            },
                                            child: SizedBox(
                                              height: maxSize * 0.1,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    maxSize * 0.02),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Assets.images.dice.image(
                                                        color: Colors
                                                            .orange.shade100),
                                                    SizedBox(
                                                        width: maxSize * 0.02),
                                                    Text('Randomize',
                                                        style: TextStyle(
                                                            color: Colors.orange
                                                                .shade100,
                                                            fontSize: maxSize *
                                                                0.04)),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            )
          ]),
        );
      }),
    );
  }
}
