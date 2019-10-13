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

void replaceTo(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => screen),
  );
}

void navigateTo(BuildContext context, Widget screen) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => screen),
  );
}
