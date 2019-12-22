import 'package:flutter/material.dart';
import 'package:millenium/src/components/detalhamento_classe/habilidades.dart';
import 'package:millenium/src/components/detalhamento_classe/titulo.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

class GuerreiroTab extends StatelessWidget {
  final List<Habilidade> habilidades;
  final List<Habilidade> habilidadesAprendizagem;

  GuerreiroTab({this.habilidades, this.habilidadesAprendizagem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Titulo(
              titulo: "Guerreiro",
              subTitulo:
                  "Principal classe, especializado em táticas de combate e no combate de armas de porte médio ou pesado.",
            ),
            Habilidades(habilidades: habilidades),
            HabilidadeAprendizagem(habilidades: habilidadesAprendizagem),
          ],
        ),
      ),
    );
  }
}
