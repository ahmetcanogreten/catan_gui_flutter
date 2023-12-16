import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return CATScaffold(
        body: Stack(fit: StackFit.expand, children: [
          Assets.images.catanBackground.image(fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              // borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {
                context.go(homeRoute);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          )
        ]),
      );
    });
  }
}
