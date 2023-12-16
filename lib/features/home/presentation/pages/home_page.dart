import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/home/presentation/widgets/home_button.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                            BlocBuilder<AuthenticationCubit,
                                AuthenticationState>(
                              buildWhen: (previous, current) =>
                                  current is LoggedIn,
                              builder: (context, state) {
                                final firstName =
                                    (state as LoggedIn).user.firstName;

                                return FittedBox(
                                  child: Text('Welcome $firstName,',
                                      style: TextStyle(
                                          color: Colors.orange.shade100)),
                                );
                              },
                            ),
                            BlocListener<AuthenticationCubit,
                                AuthenticationState>(
                              listener: (context, state) {
                                if (state is NotLoggedIn) {
                                  context.go(authenticationRoute);
                                }
                              },
                              child: FittedBox(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () {
                                      context
                                          .read<AuthenticationCubit>()
                                          .logout();
                                    },
                                    child: Ink(
                                      child: Container(
                                        padding: EdgeInsets.all(maxSize * 0.01),
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade100
                                              .withOpacity(0.70),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: const Icon(Icons.logout,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // New Game Button
                                SizedBox(
                                  height: maxSize * 0.4,
                                  width: maxSize * 0.4,
                                  child: HomeButton(
                                    iconData: Icons.add_rounded,
                                    text: 'New Game',
                                    onPressed: () {
                                      context.go(newGameRoute);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: maxSize * 0.4,
                                  width: maxSize * 0.4,
                                  child: HomeButton(
                                    iconData: Icons.key_rounded,
                                    text: 'Join Game',
                                    onPressed: () {
                                      // context
                                      //     .read<AuthenticationCubit>()
                                      //     .logOutUser();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: maxSize * 0.4,
                                  width: maxSize * 0.4,
                                  child: HomeButton(
                                    iconData: Icons.emoji_events_rounded,
                                    text: 'Leaderboard',
                                    onPressed: () {
                                      // context
                                      //     .read<AuthenticationCubit>()
                                      //     .logOutUser();
                                    },
                                  ),
                                ),

                                // Join Game
                                // Leaderboard
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
