import 'package:flutter/material.dart';
import 'package:millenium/src/components/tiles/habilidade_tile.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

class Habilidades extends StatelessWidget {
  final List<Habilidade> habilidades;

  Habilidades({@required this.habilidades});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "Habilidades",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: habilidades.map((habilidade) {
            return HabilidadeTile(habilidade: habilidade);
          }).toList(),
        ),
      ],
    );
  }
}

class HabilidadeAprendizagem extends StatelessWidget {
  final List<Habilidade> habilidades;

  HabilidadeAprendizagem({@required this.habilidades});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "Habilidades de Aprendizagem",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: habilidades.map((habilidade) {
            return HabilidadeTile(habilidade: habilidade);
          }).toList(),
        ),
      ],
    );
  }
}
