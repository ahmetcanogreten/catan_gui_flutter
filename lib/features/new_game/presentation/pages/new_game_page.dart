import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewGamePage extends StatefulWidget {
  const NewGamePage({super.key});

  @override
  State<NewGamePage> createState() => _NewGamePageState();
}

class _NewGamePageState extends State<NewGamePage> {
  List<User> _users_in_the_room = [
    User(id: 'a', firstName: 'Ahmet Can', lastName: 'Öğreten', email: 'asdasd'),
  ];

  @override
  void initState() {
    super.initState();
    final user = (context.read<AuthenticationCubit>().state as LoggedIn).user;
    _users_in_the_room.add(user);
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
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        final user = _users_in_the_room[index];

                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32, vertical: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade100,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                              '${user.firstName} ${user.lastName}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: maxSize * 0.04)),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: maxSize * 0.02);
                                      },
                                      itemCount: _users_in_the_room.length),
                                ),
                                SizedBox(
                                  height: maxSize * 0.1,
                                  width: maxSize * 0.2,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        context.go(homeRoute);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade900,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: FittedBox(
                                          child: Text('Start',
                                              style: TextStyle(
                                                  color:
                                                      Colors.orange.shade100)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex: 2, child: SizedBox.shrink())
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
