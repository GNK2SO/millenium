import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField<T> extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Stream stream;
  final Sink sink;
  final Function(String) onSaved;
  final Function(String) validator;

  CustomTextField({
    this.padding,
    this.contentPadding,
    this.controller,
    this.labelText,
    this.obscureText: false,
    this.stream,
    this.sink,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: this.stream,
      builder: (context, snapshot) {
        return Padding(
          padding: this.padding ?? const EdgeInsets.symmetric(vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: this.labelText,
              contentPadding: this.contentPadding ?? const EdgeInsets.all(0),
            ),
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            obscureText: this.obscureText,
            onChanged: (value) {
              this.sink.add(value);
            },
            onSaved: this.onSaved,
            validator: this.validator,
          ),
        );
      },
    );
  }
}
