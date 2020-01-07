import 'package:flutter/material.dart';
import 'package:millenium/src/models/consumivel/consumivel.dart';

class ConsumivelTile extends StatelessWidget {
  final Consumivel consumivel;

  ConsumivelTile({this.consumivel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        consumivel.vida != 0 ? Text("Vida: ${consumivel.vida}") : Container(),
        consumivel.energia != 0
            ? Text("Vida: ${consumivel.energia}")
            : Container(),
        consumivel.mana != 0 ? Text("Vida: ${consumivel.mana}") : Container(),
        Text("\n${consumivel.descricao}"),
      ],
    );
  }
}
