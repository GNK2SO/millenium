import 'package:flutter/material.dart';

final primaryColor = Color(0xFF012F4F);
Map<int, Color> materialColor = {
  50: Color.fromRGBO(1, 14, 79, .1),
  100: Color.fromRGBO(1, 14, 79, .2),
  200: Color.fromRGBO(1, 14, 79, .3),
  300: Color.fromRGBO(1, 14, 79, .4),
  400: Color.fromRGBO(1, 14, 79, .5),
  500: Color.fromRGBO(1, 14, 79, .6),
  600: Color.fromRGBO(1, 14, 79, .7),
  700: Color.fromRGBO(1, 14, 79, .8),
  800: Color.fromRGBO(1, 14, 79, .9),
  900: Color.fromRGBO(1, 14, 79, 1),
};

final temaNorte = ThemeData(
  primaryColor: primaryColor,
  primarySwatch: MaterialColor(0xFF012F4F, materialColor),
  primaryTextTheme: TextTheme(
    body1: TextStyle(color: primaryColor),
  ),
);

final inputDecoration = InputDecorationTheme(
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
);

final textSecondary = TextStyle(
  color: Colors.white,
);
