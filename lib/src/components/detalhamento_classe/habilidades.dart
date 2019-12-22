import 'package:flutter/material.dart';
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

class HabilidadeTile extends StatelessWidget {
  final Habilidade habilidade;

  HabilidadeTile({this.habilidade});

  @override
  Widget build(BuildContext context) {
    if (habilidade.tipo == "Passiva") {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    habilidade.titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    habilidade.tipo,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Text(habilidade.descricao),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  habilidade.titulo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  habilidade.tipo,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  "Custo: ${habilidade.custo}",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Text(
            habilidade.descricao,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
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
