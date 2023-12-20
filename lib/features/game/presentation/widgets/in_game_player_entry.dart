import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:catan_gui_flutter/models/user_state.dart';
import 'package:flutter/material.dart';

class InGamePlayerEntry extends StatelessWidget {
  final bool isTurnPlayer;
  final User user;
  final UserState userState;

  const InGamePlayerEntry({
    super.key,
    required this.isTurnPlayer,
    required this.user,
    required this.userState,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Container(
        height: maxSize * 0.5,
        padding:
            const EdgeInsets.only(left: 16, right: 32, top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isTurnPlayer ? Colors.green.shade900 : Colors.transparent,
            width: maxSize * 0.02,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: maxSize * 0.01),
            Expanded(
              child: Column(
                children: [
                  Text(user.firstName,
                      style: TextStyle(
                          color: Colors.black, fontSize: maxSize * 0.075)),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Assets.images.hills.image()),
                              Text(userState.numberOfBricks.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: maxSize * 0.075)),
                            ],
                          ),
                        ),
                        SizedBox(width: maxSize * 0.02),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Assets.images.forest.image()),
                              Text(userState.numberOfLumber.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: maxSize * 0.075)),
                            ],
                          ),
                        ),
                        SizedBox(width: maxSize * 0.02),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Assets.images.mountains.image()),
                              Text(userState.numberOfOre.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: maxSize * 0.075)),
                            ],
                          ),
                        ),
                        SizedBox(width: maxSize * 0.02),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Assets.images.fields.image()),
                              Text(userState.numberOfGrain.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: maxSize * 0.075)),
                            ],
                          ),
                        ),
                        SizedBox(width: maxSize * 0.02),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Assets.images.pasture.image()),
                              Text(userState.numberOfWool.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: maxSize * 0.075)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
