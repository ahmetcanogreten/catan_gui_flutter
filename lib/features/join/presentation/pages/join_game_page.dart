import 'package:catan_gui_flutter/features/join/cubit/join_game_cubit.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:catan_gui_flutter/widgets/cat_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class JoinGamePage extends StatefulWidget {
  const JoinGamePage({super.key});

  @override
  State<JoinGamePage> createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  final _roomCodeController = TextEditingController();

  @override
  void dispose() {
    _roomCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return BlocProvider(
        create: (context) => JoinRoomCubit(),
        child: CATScaffold(
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
                                      context.pop();
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(height: maxSize * 0.02),
                        Expanded(
                          child: LayoutBuilder(builder: (context, constraints) {
                            final maxSize =
                                constraints.maxWidth > constraints.maxHeight
                                    ? constraints.maxHeight
                                    : constraints.maxWidth;

                            return BlocConsumer<JoinRoomCubit, JoinRoomState>(
                              listener: (context, state) {
                                if (state is JoinRoomSuccess) {
                                  context.go(
                                    lobbyRoute,
                                    extra: {
                                      'isOwner': false,
                                      'roomId': state.roomId,
                                    },
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is JoinRoomInProgress) {
                                  return Center(
                                    child: SizedBox(
                                      width: maxSize * 0.25,
                                      height: maxSize * 0.25,
                                      child: CircularProgressIndicator(
                                        color: Colors.orange.shade100,
                                      ),
                                    ),
                                  );
                                }

                                return SizedBox(
                                  width: maxSize * 0.75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Enter Room Code',
                                        style: TextStyle(
                                          color: Colors.orange.shade100,
                                          fontSize: maxSize * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: maxSize * 0.05),
                                      CATTextFormField(
                                        onChanged: () => setState(() {}),
                                        controller: _roomCodeController,
                                        validator: (value) => value == null ||
                                                value.isEmpty ||
                                                value.length != 6
                                            ? 'Please enter a room code'
                                            : null,
                                        labelText: 'Room Code',
                                        color: Colors.orange.shade100,
                                      ),
                                      SizedBox(height: maxSize * 0.05),
                                      CATElevatedButton(
                                          foregroundColor:
                                              Colors.orange.shade100,
                                          backgroundColor:
                                              Colors.orange.shade900,
                                          onPressed: _roomCodeController
                                                  .text.isEmpty
                                              ? null
                                              : () {
                                                  if (_roomCodeController
                                                      .text.isNotEmpty) {
                                                    context
                                                        .read<JoinRoomCubit>()
                                                        .joinGame(
                                                            roomCode:
                                                                _roomCodeController
                                                                    .text);
                                                  }
                                                },
                                          child: Text(
                                            'Join Game',
                                            style: TextStyle(
                                              color: Colors.orange.shade100,
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        )
                      ])),
            )
          ]),
        ),
      );
    });
  }
}
