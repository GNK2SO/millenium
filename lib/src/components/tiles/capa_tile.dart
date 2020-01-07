import 'package:flutter/material.dart';
import 'package:millenium/src/models/equipamento/capa/capa.dart';

class CapaTile extends StatelessWidget {
  final Capa capa;

  CapaTile({this.capa});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Res. Frio: ${capa.resistenciaFrio}"),
        Text("\n${capa.descricao}"),
      ],
    );
  }
}
