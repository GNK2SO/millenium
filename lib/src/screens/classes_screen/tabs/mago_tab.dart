import 'package:flutter/material.dart';
import 'package:millenium/src/components/detalhamento_classe/habilidades.dart';
import 'package:millenium/src/components/detalhamento_classe/titulo.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

class MagoTab extends StatelessWidget {
  final List<Habilidade> habilidades;
  final List<Habilidade> habilidadesAprendizagem;

  MagoTab({this.habilidades, this.habilidadesAprendizagem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Titulo(
              titulo: "Mago",
              subTitulo: "Especialista em magias.",
            ),
            Habilidades(habilidades: habilidades),
            HabilidadeAprendizagem(habilidades: habilidadesAprendizagem),
          ],
        ),
      ),
    );
  }
}
