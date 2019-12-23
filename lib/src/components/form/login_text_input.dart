import 'package:flutter/material.dart';

class LoginTextInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;

  LoginTextInput({
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          errorStyle: TextStyle(
            color: Colors.white,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
