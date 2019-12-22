import 'package:flutter/material.dart';
import 'package:millenium/src/components/detalhamento_classe/habilidades.dart';
import 'package:millenium/src/components/detalhamento_classe/titulo.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

class AssassinoTab extends StatelessWidget {
  final List<Habilidade> habilidades;
  final List<Habilidade> habilidadesAprendizagem;

  AssassinoTab({this.habilidades, this.habilidadesAprendizagem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Titulo(
              titulo: "Assassino",
              subTitulo:
                  "Especialista com armas leves, venenos e assassinatos.",
            ),
            Habilidades(habilidades: habilidades),
            HabilidadeAprendizagem(habilidades: habilidadesAprendizagem),
          ],
        ),
      ),
    );
  }
}
