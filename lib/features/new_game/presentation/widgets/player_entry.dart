import 'package:flutter/material.dart';

class PlayerEntry extends StatelessWidget {
  final String name;
  final bool removeable;
  final VoidCallback? onRemove;
  const PlayerEntry(
      {super.key, required this.name, this.removeable = false, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Container(
        padding:
            const EdgeInsets.only(left: 16, right: 32, top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: maxSize * 0.1,
              child: removeable
                  ? IconButton(
                      color: Colors.red,
                      onPressed: onRemove,
                      icon: const Icon(Icons.close))
                  : null,
            ),
            SizedBox(width: maxSize * 0.01),
            Text(name,
                style:
                    TextStyle(color: Colors.black, fontSize: maxSize * 0.075)),
          ],
        ),
      );
    });
  }
}
