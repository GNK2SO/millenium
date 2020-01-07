import 'package:flutter/material.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';

class ArmaduraTile extends StatelessWidget {
  final Armadura armadura;

  ArmaduraTile({this.armadura});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Defesa: ${armadura.defesa}"),
        Text("Tipo: ${armadura.tipoEquipamento}"),
        Text("Parte: ${armadura.parte}"),
        Text("\n${armadura.descricao}"),
      ],
    );
  }
}
