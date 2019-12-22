import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String titulo;
  final String subTitulo;

  Titulo({@required this.titulo, @required this.subTitulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            titulo,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          subTitulo,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
