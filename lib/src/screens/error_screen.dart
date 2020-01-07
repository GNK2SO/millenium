import 'package:flutter/material.dart';
import 'package:millenium/src/util/theme.dart';

class ErroScreen extends StatelessWidget {
  final String erro;

  ErroScreen({this.erro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 80,
              color: primaryColor.withOpacity(0.5),
            ),
            Text(
              erro ?? "Estado inválido.\nReclame com o programador.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: primaryColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
