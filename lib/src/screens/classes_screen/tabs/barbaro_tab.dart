import 'package:flutter/material.dart';
import 'package:millenium/src/components/detalhamento_classe/habilidades.dart';
import 'package:millenium/src/components/detalhamento_classe/titulo.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

class BarbaroTab extends StatelessWidget {
  final List<Habilidade> habilidades;
  final List<Habilidade> habilidadesAprendizagem;

  BarbaroTab({this.habilidades, this.habilidadesAprendizagem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Titulo(
              titulo: "Bárbaro",
              subTitulo:
                  "Classe tribal especializada na construção, no combate e na caça.",
            ),
            Habilidades(habilidades: habilidades),
            HabilidadeAprendizagem(habilidades: habilidadesAprendizagem),
          ],
        ),
      ),
    );
  }
}
