import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/lobby/models/resource.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/catan_board.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/player_entry.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  int _numberOfBots = 0;

  final List<Resource> _resources = [
    Resource.mountains,
    Resource.mountains,
    Resource.mountains,
    Resource.forest,
    Resource.forest,
    Resource.forest,
    Resource.forest,
    Resource.hills,
    Resource.hills,
    Resource.hills,
    Resource.fields,
    Resource.fields,
    Resource.fields,
    Resource.fields,
    Resource.pasture,
    Resource.pasture,
    Resource.pasture,
    Resource.pasture,
  ];

  final List<int> _numbers = [
    2,
    3,
    3,
    4,
    4,
    5,
    5,
    6,
    6,
    8,
    8,
    9,
    9,
    10,
    10,
    11,
    11,
    12
  ];

  void shuffleResources() {
    setState(() {
      _resources.shuffle();
      _numbers.shuffle();
    });
  }

  @override
  void initState() {
    super.initState();
    shuffleResources();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: maxSize * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FittedBox(
                              child: IconButton(
                                color: Colors.orange.shade100,
                                icon: const Icon(Icons.arrow_back_rounded),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlocBuilder<AuthenticationCubit,
                                        AuthenticationState>(
                                      builder: (context, state) {
                                        final user = (state as LoggedIn).user;

                                        return PlayerEntry(
                                            name:
                                                '${user.firstName} ${user.lastName}');
                                      },
                                    ),
                                    SizedBox(height: maxSize * 0.02),
                                    ...List.generate(
                                      _numberOfBots,
                                      (index) => Column(
                                        children: [
                                          PlayerEntry(
                                              name: 'Bot ${index + 1}',
                                              removeable: true,
                                              onRemove: () {
                                                setState(() {
                                                  _numberOfBots--;
                                                });
                                              }),
                                          SizedBox(height: maxSize * 0.02),
                                        ],
                                      ),
                                    ),
                                    if (_numberOfBots < 3) ...[
                                      SizedBox(height: maxSize * 0.02),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {
                                              setState(() {
                                                _numberOfBots++;
                                              });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                      vertical: 16),
                                              decoration: BoxDecoration(
                                                color: Colors.orange.shade100
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Text('+ Add bot',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          maxSize * 0.025)),
                                            )),
                                      ),
                                    ]
                                  ],
                                )

                                    // ListView.separated(
                                    //     itemBuilder: (context, index) {
                                    //       final user = _usersInTheRoom[index];

                                    //       return Container(
                                    //         padding: const EdgeInsets.symmetric(
                                    //             horizontal: 32, vertical: 16),
                                    //         decoration: BoxDecoration(
                                    //           color: Colors.orange.shade100,
                                    //           borderRadius:
                                    //               BorderRadius.circular(16),
                                    //         ),
                                    //         child: Text(
                                    //             '${user.firstName} ${user.lastName}',
                                    //             style: TextStyle(
                                    //                 color: Colors.black,
                                    //                 fontSize: maxSize * 0.04)),
                                    //       );
                                    //     },
                                    //     separatorBuilder: (context, index) {
                                    //       return SizedBox(height: maxSize * 0.02);
                                    //     },
                                    //     itemCount: _usersInTheRoom.length),
                                    ),
                                SizedBox(
                                  height: maxSize * 0.1,
                                  width: maxSize * 0.2,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        context.go(gameRoute);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade900,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: FittedBox(
                                          child: Text(
                                            'Start',
                                            style: TextStyle(
                                              color: Colors.orange.shade100,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CatanBoard(
                                      resources: _resources, number: _numbers),
                                ),
                                SizedBox(height: maxSize * 0.05),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        shuffleResources();
                                      },
                                      child: SizedBox(
                                        height: maxSize * 0.1,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(maxSize * 0.02),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Assets.images.dice.image(
                                                  color:
                                                      Colors.orange.shade100),
                                              SizedBox(width: maxSize * 0.02),
                                              Text('Randomize',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100,
                                                      fontSize:
                                                          maxSize * 0.04)),
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
                )),
          )
        ]),
      );
    });
  }
}
