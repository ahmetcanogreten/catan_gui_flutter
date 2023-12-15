import 'package:flutter/material.dart';

class CATTextButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final Widget child;
  const CATTextButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        padding: EdgeInsets.zero,
        foregroundColor: foregroundColor,
      ),
      child: child,
    );
  }
}
