import 'package:flutter/material.dart';

final primaryColor = Color(0xFF012F4F);

final temaNorte = ThemeData(
  primaryColor: primaryColor,
  primaryTextTheme: TextTheme(
    body1: TextStyle(
      color: primaryColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
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
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
);

final textSecondary = TextStyle(
  color: Colors.white,
);
