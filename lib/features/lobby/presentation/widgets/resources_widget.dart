import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/features/lobby/presentation/widgets/on_centers_widget.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

Widget getResourceImage(ResourceType resource) {
  switch (resource) {
    case ResourceType.fields:
      return Assets.images.fields.image(fit: BoxFit.fill);
    case ResourceType.forest:
      return Assets.images.forest.image(fit: BoxFit.fill);
    case ResourceType.hills:
      return Assets.images.hills.image(fit: BoxFit.fill);
    case ResourceType.mountains:
      return Assets.images.mountains.image(fit: BoxFit.fill);
    case ResourceType.pasture:
      return Assets.images.pasture.image(fit: BoxFit.fill);
    case ResourceType.desert:
      return Assets.images.desert.image(fit: BoxFit.fill);
  }
}

class ResourcesWidget extends StatelessWidget {
  final double hexagonWidth;
  final double hexagonHeight;
  final double horizontalShift;
  final double verticalShift;
  final List<ResourceType> resources;

  const ResourcesWidget({
    super.key,
    required this.hexagonWidth,
    required this.hexagonHeight,
    required this.horizontalShift,
    required this.verticalShift,
    required this.resources,
  });

  @override
  Widget build(BuildContext context) {
    return OnCentersWidget(
        hexagonWidth: hexagonWidth,
        hexagonHeight: hexagonHeight,
        horizontalShift: horizontalShift,
        verticalShift: verticalShift,
        children: resources
            .map((resource) => SizedBox(
                  width: hexagonWidth,
                  height: hexagonHeight,
                  child: getResourceImage(resource),
                ))
            .toList());
  }
}
