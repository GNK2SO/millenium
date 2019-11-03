import 'package:flutter/material.dart';

class CustomTextField<T> extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final int maxLines;
  final InputBorder border;
  final TextInputType keyboardType;
  final String hintText;
  final Function(String) onSaved;
  final Function(String) validator;

  CustomTextField({
    this.padding,
    this.contentPadding,
    this.controller,
    this.labelText,
    this.obscureText: false,
    this.keyboardType,
    this.border,
    this.maxLines,
    this.hintText,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: this.hintText,
          labelText: this.labelText,
          contentPadding: this.contentPadding ?? const EdgeInsets.all(0),
          border: this.border,
        ),
        maxLines: this.maxLines,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        controller: controller,
        obscureText: this.obscureText,
        onSaved: this.onSaved,
        validator: this.validator,
      ),
    );
  }
}
