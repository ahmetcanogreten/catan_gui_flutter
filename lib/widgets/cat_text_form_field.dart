import 'package:flutter/material.dart';

class CATTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onChanged;

  final Color color;
  const CATTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.color = Colors.white,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  State<CATTextFormField> createState() => _CATTextFormFieldState();
}

class _CATTextFormFieldState extends State<CATTextFormField> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      obscuringCharacter: '•',
      obscureText: widget.obscureText,
      onChanged: (value) {
        setState(() {});
        if (widget.onChanged != null) widget.onChanged!();
      },
      cursorColor: widget.color,
      validator: widget.validator,
      style: TextStyle(color: widget.color),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText ?? '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        label: widget.labelText != null
            ? Text(widget.labelText!, style: TextStyle(color: widget.color))
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.color,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.color,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.color,
            width: 2,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.orange),
      ),
    );
  }
}
