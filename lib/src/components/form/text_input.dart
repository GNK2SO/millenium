import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;

  TextInput({
    this.controller,
    this.labelText,
    this.obscureText: false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
