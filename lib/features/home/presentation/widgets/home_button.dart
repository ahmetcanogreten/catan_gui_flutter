import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.iconData,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.orange.shade800;
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(maxSize * 0.05),
            decoration: BoxDecoration(
              color: Colors.orange.shade100.withOpacity(0.70),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, color: color, size: maxSize * 0.5),
                Text(text,
                    style: TextStyle(
                        color: color,
                        fontSize: maxSize * 0.1,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
