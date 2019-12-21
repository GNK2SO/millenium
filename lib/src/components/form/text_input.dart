import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;
  final Color primaryColor;

  TextInput({
    this.primaryColor: Colors.white,
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
        style: TextStyle(
          color: this.primaryColor,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF0000),
            ),
          ),
        ),
        cursorColor: primaryColor,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
