import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/lobby/models/building_with_color.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/city_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_im_animations/im_animations.dart';

class ConditionalCityWidget extends StatefulWidget {
  final bool canBeBought;
  final List<BuildingWithColor> cities;
  final int index;
  const ConditionalCityWidget({
    super.key,
    required this.cities,
    this.canBeBought = false,
    required this.index,
  });

  @override
  State<ConditionalCityWidget> createState() => _ConditionalCityWidgetState();
}

class _ConditionalCityWidgetState extends State<ConditionalCityWidget> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.cities.any((element) => element.index == widget.index)) {
      return const SizedBox.shrink();
    }

    Widget cityWidget = LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxHeight > constraints.maxWidth
          ? constraints.maxHeight
          : constraints.maxWidth;

      return SizedBox(
        width: maxSize * 10,
        height: maxSize * 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: widget.canBeBought
                  ? () {
                      setState(() {
                        _isClicked = true;
                      });
                    }
                  : null,
              child: CityWidget(
                  size: maxSize * 0.3,
                  color: widget.cities
                      .firstWhere((element) => element.index == widget.index)
                      .color),
            ),
          ],
        ),
      );
    });

    if (widget.canBeBought) {
      cityWidget = Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            HeartBeat(
              child: Opacity(opacity: 0.5, child: cityWidget),
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
                        IconButton(
                            color: Colors.green,
                            onPressed: () {
                              setState(() {
                                context.read<GameCubit>().buildCity(
                                      userId: (context
                                              .read<AuthenticationCubit>()
                                              .state as LoggedIn)
                                          .user
                                          .id,
                                      cityIndex: widget.index,
                                    );
                                _isClicked = false;
                              });
                            },
                            icon: const Icon(Icons.check_rounded)),
                        IconButton(
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                _isClicked = false;
                              });
                            },
                            icon: const Icon(Icons.close_outlined)),
                      ],
                    ),
                  );
                }),
              ),
          ],
        ),
      );
    }

    return cityWidget;
  }
}
