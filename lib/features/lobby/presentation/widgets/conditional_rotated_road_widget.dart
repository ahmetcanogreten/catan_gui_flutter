import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/road_widget.dart';
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_im_animations/im_animations.dart';

class ConditionalRotatedRoadWidget extends StatefulWidget {
  final bool canBeBought;
  final List<BuildingWithColor> roads;
  final int index;
  final double angle;
  const ConditionalRotatedRoadWidget({
    super.key,
    this.canBeBought = false,
    required this.roads,
    required this.index,
    required this.angle,
  });

  @override
  State<ConditionalRotatedRoadWidget> createState() =>
      _ConditionalRotatedRoadWidgetState();
}

class _ConditionalRotatedRoadWidgetState
    extends State<ConditionalRotatedRoadWidget> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.roads.any((element) => element.index == widget.index)) {
      return const SizedBox.shrink();
    }

    Widget roadWidget = LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxHeight > constraints.maxWidth
          ? constraints.maxHeight
          : constraints.maxWidth;

      return DeferPointer(
        child: Transform.rotate(
          angle: widget.angle,
          child: InkWell(
            onTap: widget.canBeBought
                ? () {
                    setState(() {
                      _isClicked = true;
                    });
                  }
                : null,
            child: RoadWidget(
                width: maxSize * 0.5,
                length: maxSize * 0.05,
                color: widget.roads
                    .firstWhere((element) => element.index == widget.index)
                    .color),
          ),
        ),
      );
    });

    if (widget.canBeBought) {
      roadWidget = Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          HeartBeat(
            child: Opacity(opacity: 0.5, child: roadWidget),
          ),
          if (_isClicked)
            Transform.translate(
              offset: const Offset(40, -40),
              child: LayoutBuilder(builder: (context, constraints) {
                final maxSize = constraints.maxHeight > constraints.maxWidth
                    ? constraints.maxHeight
                    : constraints.maxWidth;

                return Container(
                  width: maxSize * 0.5,
                  height: maxSize * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      DeferPointer(
                        child: IconButton(
                            color: Colors.green,
                            onPressed: () {
                              setState(() {
                                context.read<GameCubit>().buildRoad(
                                      userId: (context
                                              .read<AuthenticationCubit>()
                                              .state as LoggedIn)
                                          .user
                                          .id,
                                      roadIndex: widget.index,
                                    );
                                _isClicked = false;
                              });
                            },
                            icon: const Icon(Icons.check_rounded)),
                      ),
                      DeferPointer(
                        child: IconButton(
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                _isClicked = false;
                              });
                            },
                            icon: const Icon(Icons.close_outlined)),
                      ),
                    ],
                  ),
                );
              }),
            ),
        ],
      );
    }

    return roadWidget;
  }
}
