import 'package:flutter/material.dart';

class WidgetFormField extends StatefulWidget {
  final String label;
  final Widget? icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const WidgetFormField({
    Key? key,
    required this.label,
    this.icon,
    this.obscureText = false,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<WidgetFormField> createState() => _WidgetFormFieldState();
}

class _WidgetFormFieldState extends State<WidgetFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        isDense: true,
        suffixIcon: widget.icon,
      ),
    );
  }
}
