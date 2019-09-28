import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  bool obscureText;

  CustomTextField({
    this.labelText,
    this.obscureText: false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: this.labelText,
          labelStyle: TextStyle(fontSize: 20),
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),
        style: TextStyle(fontSize: 16),
        obscureText: this.obscureText,
      ),
    );
  }
}
