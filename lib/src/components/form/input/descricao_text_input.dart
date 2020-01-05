import 'package:flutter/material.dart';
import 'package:millenium/src/util/theme.dart';

class DescricaoTextInput extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;

  DescricaoTextInput({
    this.hintText,
    this.maxLines,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Theme(
        data: ThemeData(inputDecorationTheme: inputDecoration),
        child: TextFormField(
          decoration: InputDecoration(hintText: hintText),
          cursorColor: Theme.of(context).primaryColor,
          maxLines: maxLines,
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}
