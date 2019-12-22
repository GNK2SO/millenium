import 'package:flutter/material.dart';

class ErroScreen extends StatelessWidget {
  final String erro;

  ErroScreen({this.erro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(erro ?? "Falha na conexão!"),
      ),
    );
  }
}
