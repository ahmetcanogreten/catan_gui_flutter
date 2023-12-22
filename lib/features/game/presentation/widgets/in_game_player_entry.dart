import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:catan_gui_flutter/models/user_state.dart';
import 'package:flutter/material.dart';

class InGamePlayerEntry extends StatelessWidget {
  final User user;
  final UserState userState;
  final Color color;

  const InGamePlayerEntry({
    super.key,
    required this.user,
    required this.userState,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Container(
        height: maxSize * 0.5,
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.transparent,

            // color,

            // isTurnPlayer ? Colors.green.shade900 : Colors.transparent,
            width: maxSize * 0.02,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: maxSize * 0.04,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                )),
            SizedBox(width: maxSize * 0.04),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Text(user.firstName,
                        style: TextStyle(
                            color: Colors.black, fontSize: maxSize * 0.075)),
                    SizedBox(height: maxSize * 0.02),
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
                                Expanded(
                                    child: Assets.images.mountains.image()),
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
            ),
          ],
        ),
      );
    });
  }
}
