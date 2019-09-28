import 'package:flutter/material.dart';
import 'package:millenium/src/models/comunicado.dart';

class ComunicadoTile extends StatelessWidget {
  final Comunicado comunicado;

  ComunicadoTile({@required this.comunicado});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                comunicado.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(comunicado.data)
            ],
          ),
          Text(comunicado.descricao),
        ],
      ),
    );
  }
}
