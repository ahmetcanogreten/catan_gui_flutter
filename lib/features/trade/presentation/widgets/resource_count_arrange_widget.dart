import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:flutter/material.dart';

class ResourceCountArrangeWidget extends StatelessWidget {
  final Widget resourceIcon;
  final int count;
  final int maxCount;
  final Function() onPlusPressed;
  final Function() onMinusPressed;
  final bool canBeChanged;

  const ResourceCountArrangeWidget({
    super.key,
    required this.resourceIcon,
    required this.count,
    required this.maxCount,
    required this.onPlusPressed,
    required this.onMinusPressed,
    required this.canBeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: resourceIcon),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: !canBeChanged
                      ? const SizedBox.shrink()
                      : Material(
                          color: Colors.transparent,
                          child: CATElevatedButton(
                              backgroundColor: Colors.orange.shade500,
                              foregroundColor: Colors.black,
                              onPressed: count == 0 ? null : onMinusPressed,
                              child:
                                  const FittedBox(child: Icon(Icons.remove))),
                        )),
              Expanded(
                child: FittedBox(
                  child: Text(count.toString()),
                ),
              ),
              Expanded(
                  child: !canBeChanged
                      ? const SizedBox.shrink()
                      : Material(
                          color: Colors.transparent,
                          child: CATElevatedButton(
                              backgroundColor: Colors.orange.shade500,
                              foregroundColor: Colors.black,
                              onPressed:
                                  count == maxCount ? null : onPlusPressed,
                              child: const FittedBox(child: Icon(Icons.add))),
                        )),
            ],
          ),
        ),
      ],
    );
  }
}
