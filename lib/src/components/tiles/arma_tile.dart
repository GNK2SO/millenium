import 'package:flutter/material.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';

class ArmaTile extends StatelessWidget {
  final Arma arma;

  ArmaTile({this.arma});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Dano: ${arma.dano}"),
        Text("Tipo: ${arma.tipoEquipamento}"),
        Text("\n${arma.descricao}"),
      ],
    );
  }
}
