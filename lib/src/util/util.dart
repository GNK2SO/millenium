import 'package:flutter/material.dart';

void showMessage({
  @required GlobalKey<ScaffoldState> key,
  @required String mensagem,
  Color textColor,
}) {
  key.currentState.showSnackBar(
    SnackBar(
      content: Text(
        mensagem,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      duration: Duration(seconds: 3),
    ),
  );
}
