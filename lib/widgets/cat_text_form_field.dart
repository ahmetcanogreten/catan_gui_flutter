import 'package:flutter/material.dart';

class CATTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? labelText;
  final String? hintText;
  final double? borderRadius;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffixIcon;

  final Color selectedColor;
  final Color notSelectedColor;
  const CATTextFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.onTap,
    this.borderRadius,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.suffixIcon,
    this.notSelectedColor = Colors.white,
    this.selectedColor = Colors.orange,
  });

  @override
  State<CATTextFormField> createState() => _CATTextFormFieldState();
}

class _CATTextFormFieldState extends State<CATTextFormField> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  TextStyle labelStyleAccordingToValidator(
      {required Color secondaryColor, required Color primaryColor}) {
    if (widget.validator == null) {
      return TextStyle(
        color: _focusNode.hasFocus ? secondaryColor : primaryColor,
      );
    }

    if (widget.controller!.text.isEmpty) {
      return TextStyle(
        color: _focusNode.hasFocus ? secondaryColor : primaryColor,
      );
    }

    if (widget.validator!(widget.controller!.text) != null) {
      return const TextStyle(color: Colors.red);
    }

    return const TextStyle(color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      obscuringCharacter: '•',
      obscureText: widget.obscureText,
      onChanged: (value) {
        setState(() {});
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      cursorColor: widget.notSelectedColor,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: TextStyle(
          color: _focusNode.hasFocus
              ? widget.selectedColor
              : widget.notSelectedColor),
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        label: widget.labelText != null
            ? Text(widget.labelText!,
                style: labelStyleAccordingToValidator(
                    secondaryColor: widget.selectedColor,
                    primaryColor: widget.notSelectedColor))
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: BorderSide(
            color: widget.validator != null &&
                    widget.validator!(widget.controller?.text) == null
                ? Colors.green
                : widget.notSelectedColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: BorderSide(
            color: widget.validator != null &&
                    widget.validator!(widget.controller?.text) == null
                ? Colors.green
                : widget.selectedColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
